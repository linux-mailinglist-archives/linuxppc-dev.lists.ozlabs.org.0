Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9267166B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxfTZ5GMtz3c3N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NdAaTsAz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NdAaTsAz;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxfSb20KKz3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:44:14 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I7ps12027497;
	Wed, 18 Jan 2023 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eNrikyelN4WZouIDC0wvtOj0G/iRNAO8GtqvXj8AdDk=;
 b=NdAaTsAz9yVtGuxRedZdSru684VAwYWAqLh370bmsV2US+3SCVBwaAThETHfNj+TdMNn
 dEmjr8KeTJRCDkb80RUu806RAgmDJM7ZPlBYI3YbAZ369b95tCJ4xp4B2336kntUGWBb
 oivfmmcp+aJH/OuwcOK82seE0E8tKYqY5VzwqQt/YN9CxGR5mepZ4egxJwOmfuWG4xxf
 JYCs+q4Xtr91NG30Bfk5dc7H2iHesZT0obLG2OqewCe34eTDPcL4shTGOx8433Wj/Wff
 I9sh8gJb55BQNG4p2DYpU6cVcu1rWP7zr3tCXi1hn3MZ2ISo59sXyvTQXa+h1yPVqlsz jA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6a2m4hkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 08:44:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HM8lNZ004700;
	Wed, 18 Jan 2023 08:44:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16n00n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 08:44:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I8i1oS22151856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 08:44:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F06F82004B;
	Wed, 18 Jan 2023 08:44:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B2782004E;
	Wed, 18 Jan 2023 08:43:59 +0000 (GMT)
Received: from [9.43.56.135] (unknown [9.43.56.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 08:43:59 +0000 (GMT)
Message-ID: <6fd4c038-4c13-b495-dc7b-7d8cfa7d41e4@linux.ibm.com>
Date: Wed, 18 Jan 2023 14:13:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: crypto: p10-aes-gcm - Add asm markings necessary for kernel code
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20230117144747.37115c52@canb.auug.org.au>
 <Y8ZNoBSX5P0ieJ3t@gondor.apana.org.au>
 <20230118140444.25353e67@canb.auug.org.au>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20230118140444.25353e67@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNEjVrvbKitKxcjJgX5qoyOAnxQ5kTvI
X-Proofpoint-ORIG-GUID: VNEjVrvbKitKxcjJgX5qoyOAnxQ5kTvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_03,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180073
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Danny Tsen <dtsen@linux.ibm.com>, Linux Crypto List <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On 18/01/23 08:34, Stephen Rothwell wrote:
> Hi Herbert,
>
> On Tue, 17 Jan 2023 15:26:24 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
>> On Tue, Jan 17, 2023 at 02:47:47PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the crypto tree, today's linux-next build (powerpc
>>> pseries_le_defconfig) failed like this:
>>>
>>> arch/powerpc/crypto/p10_aes_gcm.o: warning: objtool: .text+0x884: unannotated intra-function call
>>> arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
>>> ld: arch/powerpc/crypto/p10_aes_gcm.o: ABI version 1 is not compatible with ABI version 2 output
>>> ld: failed to merge target specific data of file arch/powerpc/crypto/p10_aes_gcm.o
>>>
>>> Caused by commit
>>>
>>>    ca68a96c37eb ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
>>>
>>> I have applied the following hack for today.
>> Thanks Stephen, I'm going to update the previous fix as follows:
> I still get:
>
> arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
>
> from the powerpc pseries_le_defconfig build (which is otherwise ok).

Warnings [1], [2], and [3] are seen with pseries_le_defconfig.

[1] - arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
[2] - arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: .text+0x2448: unannotated intra-function call
[3] - arch/powerpc/crypto/aesp8-ppc.o: warning: objtool: .text+0x2d68: unannotated intra-function call

Given that there are no calls to _mcount, one way to address this warning, is by skipping objtool from running on arch/powerpc/crypto/aesp8-ppc.o file.
The below diff works for me.

=====
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 5b8252013abd..d00664c8d761 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -31,3 +31,5 @@ targets += aesp8-ppc.S ghashp8-ppc.S
  
  $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
         $(call if_changed,perl)
+
+OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
=====


The other way to fix these warnings is by using ANNOTATE_INTRA_FUNCTION_CALL macro to indicate that the branch target is valid. And, by annotating symbols with SYM_FUNC_START_LOCAL and SYM_FUNC_END macros.
The below diff works for me:

=====
diff --git a/arch/powerpc/crypto/aesp8-ppc.pl b/arch/powerpc/crypto/aesp8-ppc.pl
index cdbcf6e13efc..355e0036869a 100644
--- a/arch/powerpc/crypto/aesp8-ppc.pl
+++ b/arch/powerpc/crypto/aesp8-ppc.pl
@@ -80,6 +80,9 @@
  # POWER8[le]   3.96/0.72       0.74    1.1
  # POWER8[be]   3.75/0.65       0.66    1.0
  
+print "#include <linux/objtool.h>\n";
+print "#include <linux/linkage.h>\n";
+
  $flavour = shift;
  
  if ($flavour =~ /64/) {
@@ -185,7 +188,8 @@ Lset_encrypt_key:
         lis             r0,0xfff0
         mfspr           $vrsave,256
         mtspr           256,r0
-
+
+       ANNOTATE_INTRA_FUNCTION_CALL
         bl              Lconsts
         mtlr            r11
  
@@ -3039,7 +3043,7 @@ Lxts_enc6x_ret:
         .long           0
  
  .align 5
-_aesp8_xts_enc5x:
+SYM_FUNC_START_LOCAL(_aesp8_xts_enc5x)
         vcipher         $out0,$out0,v24
         vcipher         $out1,$out1,v24
         vcipher         $out2,$out2,v24
@@ -3121,6 +3125,7 @@ _aesp8_xts_enc5x:
         blr
          .long          0
          .byte          0,12,0x14,0,0,0,0,0
+SYM_FUNC_END(_aesp8_xts_enc5x)
  
  .align 5
  _aesp8_xts_decrypt6x:
@@ -3727,7 +3732,7 @@ Lxts_dec6x_ret:
         .long           0
  
  .align 5
-_aesp8_xts_dec5x:
+SYM_FUNC_START_LOCAL(_aesp8_xts_dec5x)
         vncipher        $out0,$out0,v24
         vncipher        $out1,$out1,v24
         vncipher        $out2,$out2,v24
@@ -3809,6 +3814,7 @@ _aesp8_xts_dec5x:
         blr
          .long          0
          .byte          0,12,0x14,0,0,0,0,0
+SYM_FUNC_END(_aesp8_xts_dec5x)
  ___
  }}     }}}

=====


Thanks,
Sathvika

