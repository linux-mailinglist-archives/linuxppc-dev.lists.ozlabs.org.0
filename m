Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32C278D655
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 15:50:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C/8iQNjg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbQfS57V8z3c4r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 23:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C/8iQNjg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbQdW5z9Wz2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 23:49:35 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UDnB0T023298;
	Wed, 30 Aug 2023 13:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ybn+WigOOgHTCLnez8SrXVPwc7Bin+zjnxGGcj6szkI=;
 b=C/8iQNjgOgNka9b1WA0FyS6Y8+upeDxZrt3rsN2B2YUIpfSrb8gg+szEmCjV7vsdHk45
 10YbkZyOBfNAuoY8fNNd//NAplR2g6lDZO3VMbRGcMR5TOyA5xSwJm8xZWZgGtQAm64K
 C/lsDvrcbzSBVTS+AxU/LYy1jswK1CxZdd7KrIejX0oT8tx43Fb+I6gqLchm2w8ZnMal
 NpfMFd/8kKZQEAuInJRefVfZlVNxgzEIwRsz8cerkrzFWLEfPRLunEpCG3T9LCCk7akr
 6Ud8ePE0H7jvpcog0c5hEblPdXLpVnc5K4pdqpOx/IIKAGs2iRSoXB2kTWxOhE+RQfRT bg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st705g01a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 13:49:15 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37UDYuUp014406;
	Wed, 30 Aug 2023 13:49:14 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqvqnc9h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 13:49:14 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37UDnEtc4063978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Aug 2023 13:49:14 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC94358059;
	Wed, 30 Aug 2023 13:49:13 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6927B58055;
	Wed, 30 Aug 2023 13:49:13 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Aug 2023 13:49:13 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2] crypto: vmx: Improved AES/XTS performance of 6-way unrolling for ppc.
Date: Wed, 30 Aug 2023 09:49:11 -0400
Message-Id: <20230830134911.179765-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f6Wn5jz4X4_JlEQS1-1xE2zyIMm-nqjt
X-Proofpoint-ORIG-GUID: f6Wn5jz4X4_JlEQS1-1xE2zyIMm-nqjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=643
 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308300126
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

Improve AES/XTS performance of 6-way unrolling for PowerPC up
to 17% with tcrypt.  This is done by using one instruction,
vpermxor, to replace xor and vsldoi.

The same changes were applied to OpenSSL code and a pull request was
submitted.

This patch has been tested with the kernel crypto module tcrypt.ko and
has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 drivers/crypto/vmx/aesp8-ppc.pl | 141 +++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 49 deletions(-)

diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
index 50a0a18f35da..f729589d792e 100644
--- a/drivers/crypto/vmx/aesp8-ppc.pl
+++ b/drivers/crypto/vmx/aesp8-ppc.pl
@@ -132,11 +132,12 @@ rcon:
 .long	0x1b000000, 0x1b000000, 0x1b000000, 0x1b000000	?rev
 .long	0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c, 0x0d0e0f0c	?rev
 .long	0,0,0,0						?asis
+.long	0x0f102132, 0x43546576, 0x8798a9ba, 0xcbdcedfe
 Lconsts:
 	mflr	r0
 	bcl	20,31,\$+4
 	mflr	$ptr	 #vvvvv "distance between . and rcon
-	addi	$ptr,$ptr,-0x48
+	addi	$ptr,$ptr,-0x58
 	mtlr	r0
 	blr
 	.long	0
@@ -2495,6 +2496,17 @@ _aesp8_xts_encrypt6x:
 	li		$x70,0x70
 	mtspr		256,r0
 
+	xxlor		2, 32+$eighty7, 32+$eighty7
+	vsldoi		$eighty7,$tmp,$eighty7,1        # 0x010101..87
+	xxlor		1, 32+$eighty7, 32+$eighty7
+
+	# Load XOR Lconsts.
+	mr		$x70, r6
+	bl		Lconsts
+	lxvw4x		0, $x40, r6		# load XOR contents
+	mr		r6, $x70
+	li		$x70,0x70
+
 	subi		$rounds,$rounds,3	# -4 in total
 
 	lvx		$rndkey0,$x00,$key1	# load key schedule
@@ -2537,69 +2549,77 @@ Load_xts_enc_key:
 	?vperm		v31,v31,$twk5,$keyperm
 	lvx		v25,$x10,$key_		# pre-load round[2]
 
+	# Switch to use the following codes with 0x010101..87 to generate tweak.
+	#     eighty7 = 0x010101..87
+	# vsrab         tmp, tweak, seven       # next tweak value, right shift 7 bits
+	# vand          tmp, tmp, eighty7       # last byte with carry
+	# vaddubm       tweak, tweak, tweak     # left shift 1 bit (x2)
+	# xxlor         vsx, 0, 0
+	# vpermxor      tweak, tweak, tmp, vsx
+
 	 vperm		$in0,$inout,$inptail,$inpperm
 	 subi		$inp,$inp,31		# undo "caller"
 	vxor		$twk0,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out0,$in0,$twk0
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in1, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in1
 
 	 lvx_u		$in1,$x10,$inp
 	vxor		$twk1,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in1,$in1,$in1,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out1,$in1,$twk1
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in2, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in2
 
 	 lvx_u		$in2,$x20,$inp
 	 andi.		$taillen,$len,15
 	vxor		$twk2,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in2,$in2,$in2,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out2,$in2,$twk2
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in3, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in3
 
 	 lvx_u		$in3,$x30,$inp
 	 sub		$len,$len,$taillen
 	vxor		$twk3,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in3,$in3,$in3,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out3,$in3,$twk3
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in4, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in4
 
 	 lvx_u		$in4,$x40,$inp
 	 subi		$len,$len,0x60
 	vxor		$twk4,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in4,$in4,$in4,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out4,$in4,$twk4
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in5, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in5
 
 	 lvx_u		$in5,$x50,$inp
 	 addi		$inp,$inp,0x60
 	vxor		$twk5,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in5,$in5,$in5,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out5,$in5,$twk5
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in0, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in0
 
 	vxor		v31,v31,$rndkey0
 	mtctr		$rounds
@@ -2625,6 +2645,8 @@ Loop_xts_enc6x:
 	lvx		v25,$x10,$key_		# round[4]
 	bdnz		Loop_xts_enc6x
 
+	xxlor		32+$eighty7, 1, 1	# 0x010101..87
+
 	subic		$len,$len,96		# $len-=96
 	 vxor		$in0,$twk0,v31		# xor with last round key
 	vcipher		$out0,$out0,v24
@@ -2634,7 +2656,6 @@ Loop_xts_enc6x:
 	 vaddubm	$tweak,$tweak,$tweak
 	vcipher		$out2,$out2,v24
 	vcipher		$out3,$out3,v24
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vcipher		$out4,$out4,v24
 	vcipher		$out5,$out5,v24
 
@@ -2642,7 +2663,8 @@ Loop_xts_enc6x:
 	 vand		$tmp,$tmp,$eighty7
 	vcipher		$out0,$out0,v25
 	vcipher		$out1,$out1,v25
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in1, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in1
 	vcipher		$out2,$out2,v25
 	vcipher		$out3,$out3,v25
 	 vxor		$in1,$twk1,v31
@@ -2653,13 +2675,13 @@ Loop_xts_enc6x:
 
 	and		r0,r0,$len
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vcipher		$out0,$out0,v26
 	vcipher		$out1,$out1,v26
 	 vand		$tmp,$tmp,$eighty7
 	vcipher		$out2,$out2,v26
 	vcipher		$out3,$out3,v26
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in2, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in2
 	vcipher		$out4,$out4,v26
 	vcipher		$out5,$out5,v26
 
@@ -2673,7 +2695,6 @@ Loop_xts_enc6x:
 	 vaddubm	$tweak,$tweak,$tweak
 	vcipher		$out0,$out0,v27
 	vcipher		$out1,$out1,v27
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vcipher		$out2,$out2,v27
 	vcipher		$out3,$out3,v27
 	 vand		$tmp,$tmp,$eighty7
@@ -2681,7 +2702,8 @@ Loop_xts_enc6x:
 	vcipher		$out5,$out5,v27
 
 	addi		$key_,$sp,$FRAME+15	# rewind $key_
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in3, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in3
 	vcipher		$out0,$out0,v28
 	vcipher		$out1,$out1,v28
 	 vxor		$in3,$twk3,v31
@@ -2690,7 +2712,6 @@ Loop_xts_enc6x:
 	vcipher		$out2,$out2,v28
 	vcipher		$out3,$out3,v28
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vcipher		$out4,$out4,v28
 	vcipher		$out5,$out5,v28
 	lvx		v24,$x00,$key_		# re-pre-load round[1]
@@ -2698,7 +2719,8 @@ Loop_xts_enc6x:
 
 	vcipher		$out0,$out0,v29
 	vcipher		$out1,$out1,v29
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in4, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in4
 	vcipher		$out2,$out2,v29
 	vcipher		$out3,$out3,v29
 	 vxor		$in4,$twk4,v31
@@ -2708,14 +2730,14 @@ Loop_xts_enc6x:
 	vcipher		$out5,$out5,v29
 	lvx		v25,$x10,$key_		# re-pre-load round[2]
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 
 	vcipher		$out0,$out0,v30
 	vcipher		$out1,$out1,v30
 	 vand		$tmp,$tmp,$eighty7
 	vcipher		$out2,$out2,v30
 	vcipher		$out3,$out3,v30
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in5, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in5
 	vcipher		$out4,$out4,v30
 	vcipher		$out5,$out5,v30
 	 vxor		$in5,$twk5,v31
@@ -2725,7 +2747,6 @@ Loop_xts_enc6x:
 	vcipherlast	$out0,$out0,$in0
 	 lvx_u		$in0,$x00,$inp		# load next input block
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vcipherlast	$out1,$out1,$in1
 	 lvx_u		$in1,$x10,$inp
 	vcipherlast	$out2,$out2,$in2
@@ -2738,7 +2759,10 @@ Loop_xts_enc6x:
 	vcipherlast	$out4,$out4,$in4
 	 le?vperm	$in2,$in2,$in2,$leperm
 	 lvx_u		$in4,$x40,$inp
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		10, 32+$in0, 32+$in0
+	 xxlor		32+$in0, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in0
+	 xxlor		32+$in0, 10, 10
 	vcipherlast	$tmp,$out5,$in5		# last block might be needed
 						# in stealing mode
 	 le?vperm	$in3,$in3,$in3,$leperm
@@ -2771,6 +2795,8 @@ Loop_xts_enc6x:
 	mtctr		$rounds
 	beq		Loop_xts_enc6x		# did $len-=96 borrow?
 
+	xxlor		32+$eighty7, 2, 2	# 0x010101..87
+
 	addic.		$len,$len,0x60
 	beq		Lxts_enc6x_zero
 	cmpwi		$len,0x20
@@ -3147,6 +3173,17 @@ _aesp8_xts_decrypt6x:
 	li		$x70,0x70
 	mtspr		256,r0
 
+	xxlor		2, 32+$eighty7, 32+$eighty7
+	vsldoi		$eighty7,$tmp,$eighty7,1        # 0x010101..87
+	xxlor		1, 32+$eighty7, 32+$eighty7
+
+	# Load XOR Lconsts.
+	mr		$x70, r6
+	bl		Lconsts
+	lxvw4x		0, $x40, r6		# load XOR contents
+	mr		r6, $x70
+	li		$x70,0x70
+
 	subi		$rounds,$rounds,3	# -4 in total
 
 	lvx		$rndkey0,$x00,$key1	# load key schedule
@@ -3194,64 +3231,64 @@ Load_xts_dec_key:
 	vxor		$twk0,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out0,$in0,$twk0
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in1, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in1
 
 	 lvx_u		$in1,$x10,$inp
 	vxor		$twk1,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in1,$in1,$in1,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out1,$in1,$twk1
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in2, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in2
 
 	 lvx_u		$in2,$x20,$inp
 	 andi.		$taillen,$len,15
 	vxor		$twk2,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in2,$in2,$in2,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out2,$in2,$twk2
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in3, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in3
 
 	 lvx_u		$in3,$x30,$inp
 	 sub		$len,$len,$taillen
 	vxor		$twk3,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in3,$in3,$in3,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out3,$in3,$twk3
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in4, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in4
 
 	 lvx_u		$in4,$x40,$inp
 	 subi		$len,$len,0x60
 	vxor		$twk4,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in4,$in4,$in4,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out4,$in4,$twk4
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in5, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in5
 
 	 lvx_u		$in5,$x50,$inp
 	 addi		$inp,$inp,0x60
 	vxor		$twk5,$tweak,$rndkey0
 	vsrab		$tmp,$tweak,$seven	# next tweak value
 	vaddubm		$tweak,$tweak,$tweak
-	vsldoi		$tmp,$tmp,$tmp,15
 	 le?vperm	$in5,$in5,$in5,$leperm
 	vand		$tmp,$tmp,$eighty7
 	 vxor		$out5,$in5,$twk5
-	vxor		$tweak,$tweak,$tmp
+	xxlor		32+$in0, 0, 0
+	vpermxor	$tweak, $tweak, $tmp, $in0
 
 	vxor		v31,v31,$rndkey0
 	mtctr		$rounds
@@ -3277,6 +3314,8 @@ Loop_xts_dec6x:
 	lvx		v25,$x10,$key_		# round[4]
 	bdnz		Loop_xts_dec6x
 
+	xxlor		32+$eighty7, 1, 1	# 0x010101..87
+
 	subic		$len,$len,96		# $len-=96
 	 vxor		$in0,$twk0,v31		# xor with last round key
 	vncipher	$out0,$out0,v24
@@ -3286,7 +3325,6 @@ Loop_xts_dec6x:
 	 vaddubm	$tweak,$tweak,$tweak
 	vncipher	$out2,$out2,v24
 	vncipher	$out3,$out3,v24
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vncipher	$out4,$out4,v24
 	vncipher	$out5,$out5,v24
 
@@ -3294,7 +3332,8 @@ Loop_xts_dec6x:
 	 vand		$tmp,$tmp,$eighty7
 	vncipher	$out0,$out0,v25
 	vncipher	$out1,$out1,v25
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in1, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in1
 	vncipher	$out2,$out2,v25
 	vncipher	$out3,$out3,v25
 	 vxor		$in1,$twk1,v31
@@ -3305,13 +3344,13 @@ Loop_xts_dec6x:
 
 	and		r0,r0,$len
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vncipher	$out0,$out0,v26
 	vncipher	$out1,$out1,v26
 	 vand		$tmp,$tmp,$eighty7
 	vncipher	$out2,$out2,v26
 	vncipher	$out3,$out3,v26
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in2, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in2
 	vncipher	$out4,$out4,v26
 	vncipher	$out5,$out5,v26
 
@@ -3325,7 +3364,6 @@ Loop_xts_dec6x:
 	 vaddubm	$tweak,$tweak,$tweak
 	vncipher	$out0,$out0,v27
 	vncipher	$out1,$out1,v27
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vncipher	$out2,$out2,v27
 	vncipher	$out3,$out3,v27
 	 vand		$tmp,$tmp,$eighty7
@@ -3333,7 +3371,8 @@ Loop_xts_dec6x:
 	vncipher	$out5,$out5,v27
 
 	addi		$key_,$sp,$FRAME+15	# rewind $key_
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in3, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in3
 	vncipher	$out0,$out0,v28
 	vncipher	$out1,$out1,v28
 	 vxor		$in3,$twk3,v31
@@ -3342,7 +3381,6 @@ Loop_xts_dec6x:
 	vncipher	$out2,$out2,v28
 	vncipher	$out3,$out3,v28
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vncipher	$out4,$out4,v28
 	vncipher	$out5,$out5,v28
 	lvx		v24,$x00,$key_		# re-pre-load round[1]
@@ -3350,7 +3388,8 @@ Loop_xts_dec6x:
 
 	vncipher	$out0,$out0,v29
 	vncipher	$out1,$out1,v29
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in4, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in4
 	vncipher	$out2,$out2,v29
 	vncipher	$out3,$out3,v29
 	 vxor		$in4,$twk4,v31
@@ -3360,14 +3399,14 @@ Loop_xts_dec6x:
 	vncipher	$out5,$out5,v29
 	lvx		v25,$x10,$key_		# re-pre-load round[2]
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 
 	vncipher	$out0,$out0,v30
 	vncipher	$out1,$out1,v30
 	 vand		$tmp,$tmp,$eighty7
 	vncipher	$out2,$out2,v30
 	vncipher	$out3,$out3,v30
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		32+$in5, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in5
 	vncipher	$out4,$out4,v30
 	vncipher	$out5,$out5,v30
 	 vxor		$in5,$twk5,v31
@@ -3377,7 +3416,6 @@ Loop_xts_dec6x:
 	vncipherlast	$out0,$out0,$in0
 	 lvx_u		$in0,$x00,$inp		# load next input block
 	 vaddubm	$tweak,$tweak,$tweak
-	 vsldoi		$tmp,$tmp,$tmp,15
 	vncipherlast	$out1,$out1,$in1
 	 lvx_u		$in1,$x10,$inp
 	vncipherlast	$out2,$out2,$in2
@@ -3390,7 +3428,10 @@ Loop_xts_dec6x:
 	vncipherlast	$out4,$out4,$in4
 	 le?vperm	$in2,$in2,$in2,$leperm
 	 lvx_u		$in4,$x40,$inp
-	 vxor		$tweak,$tweak,$tmp
+	 xxlor		10, 32+$in0, 32+$in0
+	 xxlor		32+$in0, 0, 0
+	 vpermxor	$tweak, $tweak, $tmp, $in0
+	 xxlor		32+$in0, 10, 10
 	vncipherlast	$out5,$out5,$in5
 	 le?vperm	$in3,$in3,$in3,$leperm
 	 lvx_u		$in5,$x50,$inp
@@ -3421,6 +3462,8 @@ Loop_xts_dec6x:
 	mtctr		$rounds
 	beq		Loop_xts_dec6x		# did $len-=96 borrow?
 
+	xxlor		32+$eighty7, 2, 2	# 0x010101..87
+
 	addic.		$len,$len,0x60
 	beq		Lxts_dec6x_zero
 	cmpwi		$len,0x20
-- 
2.31.1

