Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9540D59F123
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 03:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8Fr5pGpz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YAaktP1N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YAaktP1N;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8FB3sDNz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 11:50:37 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id e19so14435100pju.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 18:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=L7NGZhsdEddaVVBOrdKk8HCVjkHqDc2Mpm5jQDhHOGY=;
        b=YAaktP1NNPWVFKvRtKwrrwi7fLjIva09QrEEdJP8GA4E97d1+2EMVlRupiXVupMJVI
         wvjDEiRhlckpSX7gTqSUaA7QbrztFKe4g/xHbNIodHQ9aX2e6W4in0mVQKblCZtRd2o8
         EYFl+ar12z8btgiIdGIAjwzIBfUiTJ/gB0DPV2ImhWckNiW3mY1m5clv/rTHSk2D50ar
         i+5Vxude2LD6jiHukL5EIn8rx2kj3DvWxd/wK+BDZxmSEXfU1FlxCRusD9QXZxj2qtkG
         eL1KYprxEzST/Om2nflzdxCcySevHCK7BvMJ6imY0iwXOKJ9PT1p6QE9t2V0QochAwO1
         VFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=L7NGZhsdEddaVVBOrdKk8HCVjkHqDc2Mpm5jQDhHOGY=;
        b=TU5Ty1ls5BIB9gvmCJfDzaFUdOP7PtSxnhxDos+66bf3rFuFXVDLMo+xoh+5Jeo7Dg
         7PkN8hUAQeoQwVk3lzb5Lw+zKBtH1Xfwm/SSjm16UpJ0cmxW7L1iQRmsxP6NBpqnlJHz
         Y3BN9Pa89OJ6dd08OvYCKpxe2Im2ar7CpIUgpdf8eUs3y+iVxhb1KWApvwPj5d6vYpkm
         qcuXIQZ06Vp26VjR4BJ4kHxm/Ie1C5gd8qx+63XEKVWzmJSg0sbemWAHqOVM/5i55Ngj
         SNLg/oc8IivsUHvUhQA/Wb2OmGSoLGEdZ8blPxRcAHovNSgMXQtMWVFXZ1eqHwjTr+oz
         /2eg==
X-Gm-Message-State: ACgBeo38O5i8FAnYnxlvgyD2aW4xVRD9NbWZBc3GGnsLLfEKgdnQTJ6b
	PEQ5di5IX9sIcMxyOAZ3ig0=
X-Google-Smtp-Source: AA6agR4q+d8YDZ2hzBnwMIiPDeYJhQpinjKbHKe0nKnr/rKYKHsBppsuUkqqjAoroQmSrhLMmco6sQ==
X-Received: by 2002:a17:902:ebc2:b0:172:94f7:1b5e with SMTP id p2-20020a170902ebc200b0017294f71b5emr27989848plg.131.1661305834244;
        Tue, 23 Aug 2022 18:50:34 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id a3-20020a170902710300b00172e19c2fa9sm5858317pll.9.2022.08.23.18.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:50:31 -0700 (PDT)
Message-ID: <ae28ea837d733d5bdb86c9c2e44c74808fa5ee8b.camel@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
From: Jordan Niethe <jniethe5@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 24 Aug 2022 11:50:26 +1000
In-Reply-To: <20220823115952.1203106-2-mpe@ellerman.id.au>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
	 <20220823115952.1203106-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-08-23 at 21:59 +-1000, Michael Ellerman wrote:
+AD4 The semi-recent changes to MSR handling when entering RTAS (firmware)
+AD4 cause crashes on IBM Cell machines. An example trace:
+AD4 
+AD4   kernel tried to execute user page (2fff01a8) - exploit attempt? (uid: 0)
+AD4   BUG: Unable to handle kernel instruction fetch
+AD4   Faulting instruction address: 0x2fff01a8
+AD4   Oops: Kernel access of bad area, sig: 11 +AFsAIw-1+AF0
+AD4   BE PAGE+AF8-SIZE+AD0-64K MMU+AD0-Hash SMP NR+AF8-CPUS+AD0-4 NUMA Cell
+AD4   Modules linked in:
+AD4   CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.0.0-rc2-00433-gede0a8d3307a +ACM-207
+AD4   NIP:  000000002fff01a8 LR: 0000000000032608 CTR: 0000000000000000
+AD4   REGS: c0000000015236b0 TRAP: 0400   Tainted: G        W           (6.0.0-rc2-00433-gede0a8d3307a)
+AD4   MSR:  0000000008001002 +ADw-ME,RI+AD4  CR: 00000000  XER: 20000000
+AD4   ...
+AD4   NIP 0x2fff01a8
+AD4   LR  0x32608
+AD4   Call Trace:
+AD4     0xc00000000143c5f8 (unreliable)
+AD4     .rtas+AF8-call+-0x224/0x320
+AD4     .rtas+AF8-get+AF8-boot+AF8-time+-0x70/0x150
+AD4     .read+AF8-persistent+AF8-clock64+-0x114/0x140
+AD4     .read+AF8-persistent+AF8-wall+AF8-and+AF8-boot+AF8-offset+-0x24/0x80
+AD4     .timekeeping+AF8-init+-0x40/0x29c
+AD4     .start+AF8-kernel+-0x674/0x8f0
+AD4     start+AF8-here+AF8-common+-0x1c/0x50
+AD4 
+AD4 Unlike PAPR platforms where RTAS is only used in guests, on the IBM Cell
+AD4 machines Linux runs with MSR+AFs-HV+AF0 set but also uses RTAS, provided by
+AD4 SLOF.
+AD4 
+AD4 Fix it by copying the MSR+AFs-HV+AF0 bit from the MSR value we've just read
+AD4 using mfmsr into the value used for RTAS.
+AD4 
+AD4 It seems like we could also fix it using an +ACM-ifdef CELL to set MSR+AFs-HV+AF0,
+AD4 but that doesn't work because it's possible to build a single kernel
+AD4 image that runs on both Cell native and pseries.
+AD4 
+AD4 Fixes: b6b1c3ce06ca (+ACI-powerpc/rtas: Keep MSR+AFs-RI+AF0 set when calling RTAS+ACI)
+AD4 Cc: stable+AEA-vger.kernel.org +ACM v5.19+-
+AD4 Signed-off-by: Michael Ellerman +ADw-mpe+AEA-ellerman.id.au+AD4
+AD4 ---
+AD4  arch/powerpc/kernel/rtas+AF8-entry.S +AHw 4 +-+-+-+-
+AD4  1 file changed, 4 insertions(+-)
+AD4 
+AD4 diff --git a/arch/powerpc/kernel/rtas+AF8-entry.S b/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 index 9a434d42e660..6ce95ddadbcd 100644
+AD4 --- a/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 +-+-+- b/arch/powerpc/kernel/rtas+AF8-entry.S
+AD4 +AEAAQA -109,8 +-109,12 +AEAAQA +AF8-GLOBAL(enter+AF8-rtas)
+AD4  	 +ACo its critical regions (as specified in PAPR+- section 7.2.1). MSR+AFs-S+AF0
+AD4  	 +ACo is not impacted by RFI+AF8-TO+AF8-KERNEL (only urfid can unset it). So if
+AD4  	 +ACo MSR+AFs-S+AF0 is set, it will remain when entering RTAS.
+AD4 +-	 +ACo If we're in HV mode, RTAS must also run in HV mode, so extract MSR+AF8-HV
+AD4 +-	 +ACo from the saved MSR value and insert into the value RTAS will use.
+AD4  	 +ACo-/

Interestingly it looks like these are the first uses of these extended
mnemonics in the kernel?

+AD4 +-	extrdi	r0, r6, 1, 63 - MSR+AF8-HV+AF8-LG

Or in non-mnemonic form...
rldicl  r0, r6, 64 - MSR+AF8-HV+AF8-LG, 63

+AD4  	LOAD+AF8-REG+AF8-IMMEDIATE(r6, MSR+AF8-ME +AHw MSR+AF8-RI)
+AD4 +-	insrdi	r6, r0, 1, 63 - MSR+AF8-HV+AF8-LG

Or in non-mnemonic form...
rldimi	r6, r0, MSR+AF8-HV+AF8-LG, 63 - MSR+AF8-HV+AF8-LG

It is ok to use r0 as a scratch register as it is loaded with 0 afterwards anyway.

+AD4  
+AD4  	li      r0,0
+AD4  	mtmsrd  r0,1                    /+ACo disable RI before using SRR0/1 +ACo-/

Reviewed-by: Jordan Niethe +ADw-jniethe5+AEA-gmail.com+AD4

