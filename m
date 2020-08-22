Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6024E8F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 18:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYl0G4L62zDqnM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 02:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=zhongguohua1@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYkyN3zqRzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 02:54:49 +1000 (AEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3EC1FE4389AFD1442589;
 Sun, 23 Aug 2020 00:54:43 +0800 (CST)
Received: from DESKTOP-8N3QUD5.china.huawei.com (10.67.102.173) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sun, 23 Aug 2020 00:54:35 +0800
From: Guohua Zhong <zhongguohua1@huawei.com>
To: <christophe.leroy@csgroup.eu>
Subject: =?UTF-8?q?Re=EF=BC=9ARe=3A=20=5BPATCH=5D=20powerpc=3A=20Fix=20a=20bug=20in=20=5F=5Fdiv64=5F32=20if=20divisor=20is=20zero?=
Date: Sun, 23 Aug 2020 00:54:33 +0800
Message-ID: <20200822165433.58228-1-zhongguohua1@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <8dedfcce-04e0-ec7d-6af5-ec1d6d8602b0@csgroup.eu>
References: <8dedfcce-04e0-ec7d-6af5-ec1d6d8602b0@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.173]
X-CFilter-Loop: Reflected
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nixiaoming@huawei.com, zhongguohua1@huawei.com, wangle6@huawei.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>In generic version in lib/math/div64.c, there is no checking of 'base' 
>either.
>Do we really want to add this check in the powerpc version only ?

>The only user of __div64_32() is do_div() in 
>include/asm-generic/div64.h. Wouldn't it be better to do the check there ?

>Christophe

Yet, I have noticed that there is no checking of 'base' in these functions.
But I am not sure how to check is better.As we know that the result is 
undefined when divisor is zero. It maybe good to print error and dump stack.
 Let the process to know that the divisor is zero by sending SIGFPE. 

diff --git a/include/asm-generic/div64.h b/include/asm-generic/div64.h
index a3b98c86f077..161c656ee3ee 100644
--- a/include/asm-generic/div64.h
+++ b/include/asm-generic/div64.h
@@ -43,6 +43,11 @@
 # define do_div(n,base) ({                                     \
        uint32_t __base = (base);                               \
        uint32_t __rem;                                         \
+ if (unlikely(base == 0)) {                          \
+         pr_err("do_div base=%d\n",base);            \
+         dump_stack();                               \
+         force_sig(SIGFPE);                          \
+ }      


Then it also needto add this checking in functions of
div64_s64(), div64_u64(), div64_u64_rem(), div_s64_rem and div_u64_rem () 
in include/linux/math64.h

+ if (unlikely(divisor == 0)) {
+         pr_err("%s divisor=0\n",__func__);
+         dump_stack();
+         force_sig(SIGFPE);
+ }

Guohua

>>  	lwz	r5,0(r3)	# get the dividend into r5/r6
>>  	lwz	r6,4(r3)
>>  	cmplw	r5,r4
>>@@ -52,6 +55,7 @@ __div64_32:
>>  4:	stw	r7,0(r3)	# return the quotient in *r3
>>  	stw	r8,4(r3)
>>  	mr	r3,r6		# return the remainder in r3
>>+5:					# return if divisor r4 is zero
>>  	blr
>>  
>>  /*
>>diff --git a/arch/powerpc/lib/div64.S b/arch/powerpc/lib/div64.S
>>index 3d5426e7dcc4..1cc9bcabf678 100644
>>--- a/arch/powerpc/lib/div64.S
>>+++ b/arch/powerpc/lib/div64.S
>>@@ -13,6 +13,9 @@
>>  #include <asm/processor.h>
>>  
>>  _GLOBAL(__div64_32)
>>+	li	r9,0
>>+	cmplw	r4,r9	# check if divisor r4 is zero
>>+	beq	5f			# jump to label 5 if r4(divisor) is zero
>>  	lwz	r5,0(r3)	# get the dividend into r5/r6
>>  	lwz	r6,4(r3)
>>  	cmplw	r5,r4
>>@@ -52,4 +55,5 @@ _GLOBAL(__div64_32)
>>  4:	stw	r7,0(r3)	# return the quotient in *r3
>>  	stw	r8,4(r3)
>>  	mr	r3,r6		# return the remainder in r3
>>+5:					# return if divisor r4 is zero
>>  	blr
>>

