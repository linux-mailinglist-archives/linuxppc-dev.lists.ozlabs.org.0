Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401378D2D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 06:38:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WhrJ37Ng;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbBPP0wBqz3c33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 14:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WhrJ37Ng;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbBNX1Dqxz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 14:37:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693370247;
	bh=c+9MpWQMtdfgC8YXuHMOdEhIy1GyCHMukyePakrXBU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WhrJ37NgGgIrDiOYhgSMgEqK+AQE6+sANg31odcvrL94HTlJptwIDLpJpSGtOdNSZ
	 9hfxSB7bD5n07ta2ySjzeOjoBKtxmoE5gOqmRNWiVy4EWDFAFmWkQ1Ds0qa7sATE32
	 29LJk7NWbksL0bl6tQ3O8X3np7CxOz3uXFd2FljlJ0P9BDmrIdShVj+xlnFJvp41qF
	 U4A1QuwhV/BSSqVa+EIsVxTvPbiV1J0oGikrNdG9ntJipVLJRiXxx6OkEQ0eObADGx
	 24VuPpqtN5PM/2J6YKpzBkG53u2JVeWMYYvcUIdYVfHeV3kB7X9zAskvd9+0T/r1N0
	 7onwQ3n6TmCFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbBNQ0cMXz4wd0;
	Wed, 30 Aug 2023 14:37:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] crypto: vmx: Improved AES/XTS performance of 6-way
 unrolling for ppc.
In-Reply-To: <20230829153704.135475-1-dtsen@linux.ibm.com>
References: <20230829153704.135475-1-dtsen@linux.ibm.com>
Date: Wed, 30 Aug 2023 14:37:25 +1000
Message-ID: <87ledtxi0q.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Danny Tsen <dtsen@linux.ibm.com> writes:
> Improve AES/XTS performance of 6-way unrolling for PowerPC up
> to 17% with tcrypt.  This is done by using one instruction,
> vpermxor, to replace xor and vsldoi.
>
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  drivers/crypto/vmx/aesp8-ppc.pl | 141 +++++++++++++++++++++-----------
>  1 file changed, 92 insertions(+), 49 deletions(-)

That's CRYPTOGAMS code, and is so far largely unchanged from the
original. I see you've sent the same change to openssl, but it's not
merged yet. Please document that in the change log, we want to keep the
code in sync as much as possible, and document any divergences.

cheers

> diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
> index 50a0a18f35da..f729589d792e 100644
> --- a/drivers/crypto/vmx/aesp8-ppc.pl
> +++ b/drivers/crypto/vmx/aesp8-ppc.pl
> @@ -132,11 +132,12 @@ rcon:
>  .long	0x1b000000, 0x1b000000, 0x1b000000, 0x1b000000	?rev
>  .long	0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c	?rev
>  .long	0,0,0,0						?asis
> +.long	0x0f102132, 0x43546576, 0x8798a9ba, 0xcbdcedfe
>  Lconsts:
>  	mflr	r0
>  	bcl	20,31,\$+4
>  	mflr	$ptr	 #vvvvv "distance between . and rcon
> -	addi	$ptr,$ptr,-0x48
> +	addi	$ptr,$ptr,-0x58
>  	mtlr	r0
>  	blr
>  	.long	0
> @@ -2495,6 +2496,17 @@ _aesp8_xts_encrypt6x:
>  	li		$x70,0x70
>  	mtspr		256,r0
>  
> +	xxlor		2, 32+$eighty7, 32+$eighty7
> +	vsldoi		$eighty7,$tmp,$eighty7,1        # 0x010101..87
> +	xxlor		1, 32+$eighty7, 32+$eighty7
> +
> +	# Load XOR Lconsts.
> +	mr		$x70, r6
> +	bl		Lconsts
> +	lxvw4x		0, $x40, r6		# load XOR contents
> +	mr		r6, $x70
> +	li		$x70,0x70
> +
>  	subi		$rounds,$rounds,3	# -4 in total
>  
>  	lvx		$rndkey0,$x00,$key1	# load key schedule
> @@ -2537,69 +2549,77 @@ Load_xts_enc_key:
>  	?vperm		v31,v31,$twk5,$keyperm
>  	lvx		v25,$x10,$key_		# pre-load round[2]
>  
> +	# Switch to use the following codes with 0x010101..87 to generate tweak.
> +	#     eighty7 = 0x010101..87
> +	# vsrab         tmp, tweak, seven       # next tweak value, right shift 7 bits
> +	# vand          tmp, tmp, eighty7       # last byte with carry
> +	# vaddubm       tweak, tweak, tweak     # left shift 1 bit (x2)
> +	# xxlor         vsx, 0, 0
> +	# vpermxor      tweak, tweak, tmp, vsx
> +
>  	 vperm		$in0,$inout,$inptail,$inpperm
>  	 subi		$inp,$inp,31		# undo "caller"
>  	vxor		$twk0,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out0,$in0,$twk0
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in1, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in1
>  
>  	 lvx_u		$in1,$x10,$inp
>  	vxor		$twk1,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in1,$in1,$in1,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out1,$in1,$twk1
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in2, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in2
>  
>  	 lvx_u		$in2,$x20,$inp
>  	 andi.		$taillen,$len,15
>  	vxor		$twk2,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in2,$in2,$in2,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out2,$in2,$twk2
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in3, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in3
>  
>  	 lvx_u		$in3,$x30,$inp
>  	 sub		$len,$len,$taillen
>  	vxor		$twk3,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in3,$in3,$in3,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out3,$in3,$twk3
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in4, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in4
>  
>  	 lvx_u		$in4,$x40,$inp
>  	 subi		$len,$len,0x60
>  	vxor		$twk4,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in4,$in4,$in4,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out4,$in4,$twk4
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in5, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in5
>  
>  	 lvx_u		$in5,$x50,$inp
>  	 addi		$inp,$inp,0x60
>  	vxor		$twk5,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in5,$in5,$in5,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out5,$in5,$twk5
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in0, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in0
>  
>  	vxor		v31,v31,$rndkey0
>  	mtctr		$rounds
> @@ -2625,6 +2645,8 @@ Loop_xts_enc6x:
>  	lvx		v25,$x10,$key_		# round[4]
>  	bdnz		Loop_xts_enc6x
>  
> +	xxlor		32+$eighty7, 1, 1	# 0x010101..87
> +
>  	subic		$len,$len,96		# $len-=96
>  	 vxor		$in0,$twk0,v31		# xor with last round key
>  	vcipher		$out0,$out0,v24
> @@ -2634,7 +2656,6 @@ Loop_xts_enc6x:
>  	 vaddubm	$tweak,$tweak,$tweak
>  	vcipher		$out2,$out2,v24
>  	vcipher		$out3,$out3,v24
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vcipher		$out4,$out4,v24
>  	vcipher		$out5,$out5,v24
>  
> @@ -2642,7 +2663,8 @@ Loop_xts_enc6x:
>  	 vand		$tmp,$tmp,$eighty7
>  	vcipher		$out0,$out0,v25
>  	vcipher		$out1,$out1,v25
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in1, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in1
>  	vcipher		$out2,$out2,v25
>  	vcipher		$out3,$out3,v25
>  	 vxor		$in1,$twk1,v31
> @@ -2653,13 +2675,13 @@ Loop_xts_enc6x:
>  
>  	and		r0,r0,$len
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vcipher		$out0,$out0,v26
>  	vcipher		$out1,$out1,v26
>  	 vand		$tmp,$tmp,$eighty7
>  	vcipher		$out2,$out2,v26
>  	vcipher		$out3,$out3,v26
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in2, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in2
>  	vcipher		$out4,$out4,v26
>  	vcipher		$out5,$out5,v26
>  
> @@ -2673,7 +2695,6 @@ Loop_xts_enc6x:
>  	 vaddubm	$tweak,$tweak,$tweak
>  	vcipher		$out0,$out0,v27
>  	vcipher		$out1,$out1,v27
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vcipher		$out2,$out2,v27
>  	vcipher		$out3,$out3,v27
>  	 vand		$tmp,$tmp,$eighty7
> @@ -2681,7 +2702,8 @@ Loop_xts_enc6x:
>  	vcipher		$out5,$out5,v27
>  
>  	addi		$key_,$sp,$FRAME+15	# rewind $key_
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in3, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in3
>  	vcipher		$out0,$out0,v28
>  	vcipher		$out1,$out1,v28
>  	 vxor		$in3,$twk3,v31
> @@ -2690,7 +2712,6 @@ Loop_xts_enc6x:
>  	vcipher		$out2,$out2,v28
>  	vcipher		$out3,$out3,v28
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vcipher		$out4,$out4,v28
>  	vcipher		$out5,$out5,v28
>  	lvx		v24,$x00,$key_		# re-pre-load round[1]
> @@ -2698,7 +2719,8 @@ Loop_xts_enc6x:
>  
>  	vcipher		$out0,$out0,v29
>  	vcipher		$out1,$out1,v29
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in4, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in4
>  	vcipher		$out2,$out2,v29
>  	vcipher		$out3,$out3,v29
>  	 vxor		$in4,$twk4,v31
> @@ -2708,14 +2730,14 @@ Loop_xts_enc6x:
>  	vcipher		$out5,$out5,v29
>  	lvx		v25,$x10,$key_		# re-pre-load round[2]
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  
>  	vcipher		$out0,$out0,v30
>  	vcipher		$out1,$out1,v30
>  	 vand		$tmp,$tmp,$eighty7
>  	vcipher		$out2,$out2,v30
>  	vcipher		$out3,$out3,v30
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in5, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in5
>  	vcipher		$out4,$out4,v30
>  	vcipher		$out5,$out5,v30
>  	 vxor		$in5,$twk5,v31
> @@ -2725,7 +2747,6 @@ Loop_xts_enc6x:
>  	vcipherlast	$out0,$out0,$in0
>  	 lvx_u		$in0,$x00,$inp		# load next input block
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vcipherlast	$out1,$out1,$in1
>  	 lvx_u		$in1,$x10,$inp
>  	vcipherlast	$out2,$out2,$in2
> @@ -2738,7 +2759,10 @@ Loop_xts_enc6x:
>  	vcipherlast	$out4,$out4,$in4
>  	 le?vperm	$in2,$in2,$in2,$leperm
>  	 lvx_u		$in4,$x40,$inp
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		10, 32+$in0, 32+$in0
> +	 xxlor		32+$in0, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in0
> +	 xxlor		32+$in0, 10, 10
>  	vcipherlast	$tmp,$out5,$in5		# last block might be needed
>  						# in stealing mode
>  	 le?vperm	$in3,$in3,$in3,$leperm
> @@ -2771,6 +2795,8 @@ Loop_xts_enc6x:
>  	mtctr		$rounds
>  	beq		Loop_xts_enc6x		# did $len-=96 borrow?
>  
> +	xxlor		32+$eighty7, 2, 2	# 0x010101..87
> +
>  	addic.		$len,$len,0x60
>  	beq		Lxts_enc6x_zero
>  	cmpwi		$len,0x20
> @@ -3147,6 +3173,17 @@ _aesp8_xts_decrypt6x:
>  	li		$x70,0x70
>  	mtspr		256,r0
>  
> +	xxlor		2, 32+$eighty7, 32+$eighty7
> +	vsldoi		$eighty7,$tmp,$eighty7,1        # 0x010101..87
> +	xxlor		1, 32+$eighty7, 32+$eighty7
> +
> +	# Load XOR Lconsts.
> +	mr		$x70, r6
> +	bl		Lconsts
> +	lxvw4x		0, $x40, r6		# load XOR contents
> +	mr		r6, $x70
> +	li		$x70,0x70
> +
>  	subi		$rounds,$rounds,3	# -4 in total
>  
>  	lvx		$rndkey0,$x00,$key1	# load key schedule
> @@ -3194,64 +3231,64 @@ Load_xts_dec_key:
>  	vxor		$twk0,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out0,$in0,$twk0
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in1, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in1
>  
>  	 lvx_u		$in1,$x10,$inp
>  	vxor		$twk1,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in1,$in1,$in1,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out1,$in1,$twk1
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in2, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in2
>  
>  	 lvx_u		$in2,$x20,$inp
>  	 andi.		$taillen,$len,15
>  	vxor		$twk2,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in2,$in2,$in2,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out2,$in2,$twk2
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in3, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in3
>  
>  	 lvx_u		$in3,$x30,$inp
>  	 sub		$len,$len,$taillen
>  	vxor		$twk3,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in3,$in3,$in3,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out3,$in3,$twk3
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in4, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in4
>  
>  	 lvx_u		$in4,$x40,$inp
>  	 subi		$len,$len,0x60
>  	vxor		$twk4,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in4,$in4,$in4,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out4,$in4,$twk4
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in5, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in5
>  
>  	 lvx_u		$in5,$x50,$inp
>  	 addi		$inp,$inp,0x60
>  	vxor		$twk5,$tweak,$rndkey0
>  	vsrab		$tmp,$tweak,$seven	# next tweak value
>  	vaddubm		$tweak,$tweak,$tweak
> -	vsldoi		$tmp,$tmp,$tmp,15
>  	 le?vperm	$in5,$in5,$in5,$leperm
>  	vand		$tmp,$tmp,$eighty7
>  	 vxor		$out5,$in5,$twk5
> -	vxor		$tweak,$tweak,$tmp
> +	xxlor		32+$in0, 0, 0
> +	vpermxor	$tweak, $tweak, $tmp, $in0
>  
>  	vxor		v31,v31,$rndkey0
>  	mtctr		$rounds
> @@ -3277,6 +3314,8 @@ Loop_xts_dec6x:
>  	lvx		v25,$x10,$key_		# round[4]
>  	bdnz		Loop_xts_dec6x
>  
> +	xxlor		32+$eighty7, 1, 1	# 0x010101..87
> +
>  	subic		$len,$len,96		# $len-=96
>  	 vxor		$in0,$twk0,v31		# xor with last round key
>  	vncipher	$out0,$out0,v24
> @@ -3286,7 +3325,6 @@ Loop_xts_dec6x:
>  	 vaddubm	$tweak,$tweak,$tweak
>  	vncipher	$out2,$out2,v24
>  	vncipher	$out3,$out3,v24
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vncipher	$out4,$out4,v24
>  	vncipher	$out5,$out5,v24
>  
> @@ -3294,7 +3332,8 @@ Loop_xts_dec6x:
>  	 vand		$tmp,$tmp,$eighty7
>  	vncipher	$out0,$out0,v25
>  	vncipher	$out1,$out1,v25
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in1, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in1
>  	vncipher	$out2,$out2,v25
>  	vncipher	$out3,$out3,v25
>  	 vxor		$in1,$twk1,v31
> @@ -3305,13 +3344,13 @@ Loop_xts_dec6x:
>  
>  	and		r0,r0,$len
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vncipher	$out0,$out0,v26
>  	vncipher	$out1,$out1,v26
>  	 vand		$tmp,$tmp,$eighty7
>  	vncipher	$out2,$out2,v26
>  	vncipher	$out3,$out3,v26
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in2, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in2
>  	vncipher	$out4,$out4,v26
>  	vncipher	$out5,$out5,v26
>  
> @@ -3325,7 +3364,6 @@ Loop_xts_dec6x:
>  	 vaddubm	$tweak,$tweak,$tweak
>  	vncipher	$out0,$out0,v27
>  	vncipher	$out1,$out1,v27
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vncipher	$out2,$out2,v27
>  	vncipher	$out3,$out3,v27
>  	 vand		$tmp,$tmp,$eighty7
> @@ -3333,7 +3371,8 @@ Loop_xts_dec6x:
>  	vncipher	$out5,$out5,v27
>  
>  	addi		$key_,$sp,$FRAME+15	# rewind $key_
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in3, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in3
>  	vncipher	$out0,$out0,v28
>  	vncipher	$out1,$out1,v28
>  	 vxor		$in3,$twk3,v31
> @@ -3342,7 +3381,6 @@ Loop_xts_dec6x:
>  	vncipher	$out2,$out2,v28
>  	vncipher	$out3,$out3,v28
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vncipher	$out4,$out4,v28
>  	vncipher	$out5,$out5,v28
>  	lvx		v24,$x00,$key_		# re-pre-load round[1]
> @@ -3350,7 +3388,8 @@ Loop_xts_dec6x:
>  
>  	vncipher	$out0,$out0,v29
>  	vncipher	$out1,$out1,v29
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in4, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in4
>  	vncipher	$out2,$out2,v29
>  	vncipher	$out3,$out3,v29
>  	 vxor		$in4,$twk4,v31
> @@ -3360,14 +3399,14 @@ Loop_xts_dec6x:
>  	vncipher	$out5,$out5,v29
>  	lvx		v25,$x10,$key_		# re-pre-load round[2]
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  
>  	vncipher	$out0,$out0,v30
>  	vncipher	$out1,$out1,v30
>  	 vand		$tmp,$tmp,$eighty7
>  	vncipher	$out2,$out2,v30
>  	vncipher	$out3,$out3,v30
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		32+$in5, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in5
>  	vncipher	$out4,$out4,v30
>  	vncipher	$out5,$out5,v30
>  	 vxor		$in5,$twk5,v31
> @@ -3377,7 +3416,6 @@ Loop_xts_dec6x:
>  	vncipherlast	$out0,$out0,$in0
>  	 lvx_u		$in0,$x00,$inp		# load next input block
>  	 vaddubm	$tweak,$tweak,$tweak
> -	 vsldoi		$tmp,$tmp,$tmp,15
>  	vncipherlast	$out1,$out1,$in1
>  	 lvx_u		$in1,$x10,$inp
>  	vncipherlast	$out2,$out2,$in2
> @@ -3390,7 +3428,10 @@ Loop_xts_dec6x:
>  	vncipherlast	$out4,$out4,$in4
>  	 le?vperm	$in2,$in2,$in2,$leperm
>  	 lvx_u		$in4,$x40,$inp
> -	 vxor		$tweak,$tweak,$tmp
> +	 xxlor		10, 32+$in0, 32+$in0
> +	 xxlor		32+$in0, 0, 0
> +	 vpermxor	$tweak, $tweak, $tmp, $in0
> +	 xxlor		32+$in0, 10, 10
>  	vncipherlast	$out5,$out5,$in5
>  	 le?vperm	$in3,$in3,$in3,$leperm
>  	 lvx_u		$in5,$x50,$inp
> @@ -3421,6 +3462,8 @@ Loop_xts_dec6x:
>  	mtctr		$rounds
>  	beq		Loop_xts_dec6x		# did $len-=96 borrow?
>  
> +	xxlor		32+$eighty7, 2, 2	# 0x010101..87
> +
>  	addic.		$len,$len,0x60
>  	beq		Lxts_dec6x_zero
>  	cmpwi		$len,0x20
> -- 
> 2.31.1
