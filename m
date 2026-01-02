Return-Path: <linuxppc-dev+bounces-15172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1388CEF62A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 22:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djcwd1fqxz2xl0;
	Sat, 03 Jan 2026 08:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767358219;
	cv=none; b=KxGkA0HMAmRztaZq5NNZLFxAH2g/PKJtdYBuw0N+GmAlQ3Xsylx3noFTEUv2os0Vm/zGtM3GnPBs+evRDvRis3hvthOQorgJofhpgw0UC//kRfh5wt4KKCXSnjjfA/FiA4h3pCM2l2GWXe3gwOXc6oBCRdHbPKiH1RLIly7UZI8QBTeBblbeH90ZCeghkguRuomO+AhT+IpXsRI3c9oA/C/kn1ERtLpBUlxHyeukg6bmL9hJ9sf0l4a3KBRD1nkHPdZhPFOnrkS1xEBIn0K6qL0XCoUpU2aDms0fVc7wX9tae91RzMcPVvCgEdTvyjAabN4vNun6BvZ8dfcE6try5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767358219; c=relaxed/relaxed;
	bh=0NidQapPj0vF7khahdXKPN5XD/zytpGimrrQFhYOGsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DK/Mstb5/Vmxo5TuGMd0xX5vFxitSylQyKqPdpoJLfyH1z6rR+pkwCNMWawk5+Vn3+nt4oX/269pyH6jdII04Z/diJAY9mAA5X+0sJN3sbooP93JgQts/pJ8bgZggmnIunl/I1P2vadP2pCSQocy9W8JZC/3Naxe8gB2+HCFdJH73hqD3JMEfGFNe1cQUwLbXY7kFbQRmo/VZUOWrUlHErPZHxVn+PyBR+pniFCWEtNapPCh/2n/R/rdwUGibonQ/18ZLMg7BUL+v0m4BXUgIgu+FBFbMQheBgXy5aY+evNvtAugf2zn7rlh2EF2WCVJETEx69Hxs4Wm/1vrdSOdVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvbx/ZAG; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6wBYkTS; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvbx/ZAG;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6wBYkTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djNp31qWqz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 23:50:18 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VvJ5504454
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Jan 2026 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0NidQapPj0vF7khahdXKPN5XD/zytpGimrr
	QFhYOGsc=; b=Yvbx/ZAGCsTFRfNO39rnPjI2HgmNPKqr+4XtS1jBBMS01VYrEST
	pSLNy4ZcROJk2DsFz6CIArveheoiWqU8MgjWGyiqRw10DYuMZHDWYGa6jo6u6PW3
	sGKAVPGBPRZdo2GI6pRFKrQMT4JlG52SGH3H9DGzZ3KH7wgRYvwbG3yE+63b2rIV
	9IugnDoG8dR5jyU9XcdSNvd3qZuHAjKGS89R0DZn8yIhrWr7kJq3atEfJsAcY4f4
	HjKSY5WoJZIumC+KBA1MBn3EyuZ1HVvS0C5gSepn2aokelKeOK26TZO7v0hmrJ5+
	ZyLCjZT1FSI7uah3bbBi7rJAqzTElOsBwmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 12:50:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so266624501cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358216; x=1767963016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NidQapPj0vF7khahdXKPN5XD/zytpGimrrQFhYOGsc=;
        b=d6wBYkTSUor+2tWjOmvNsh+3HPUMsDuY2fFidAfJDJPnCMuW8hJLNIF3WmIJ/0yzMk
         3h1fYwKIrRhQekLsOY1IYp/W+QCQc+2o8Y8tbkasWp+c8TW2gv0ms/16cw8Lx0HxTwpF
         10M/Fr5bElm9WZeCW6zPu5funA8wWlIg7lcJP38b7SnlFKvywFB1769kvnjrAvnIfFlm
         yW3JApUKyI+Nhx210wYamw3nbpIQJZPZdMkWvn99dv0EGk2DLhHTk8FiCFs1637rIhlv
         se/uDffDz3x80a/oErnXlf+f0G474zbo6F9QhkF9lCCcT6+yh0IcrAbScs8VgsYZg520
         KpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358216; x=1767963016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NidQapPj0vF7khahdXKPN5XD/zytpGimrrQFhYOGsc=;
        b=Pg/kzI++aPy9LlHrprtA6yGiDA0/eNi4odZVPJBJzx4Lv3rHfBk9dDfeMWvaHOwTuq
         tzPvK5yHt2302bBBgIZ9yX1QPBQJFMHJVq02TFvdgeF3mxX/5t2xrxYLG8HzCEG7DfJb
         X+vnwe/wGzoNFRpWuuPtRRt0PL5F6K7ZHWjekJDcsr/jdbyactb6hbtXnBFoEUqLafS5
         wS2C/mpZ0yHz2IVBEkzTAYhzoibEv1DZCLV85nXTRRdk+T/myXfXszL/ID40ZufiKYR3
         YVWDtn6BldkdYaNNaZMUQyqlNYUqnL0UYSlGSIIENAGan+Y4LOf1ZxCX3ieOdM+3O0jo
         d15Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbzNQqZYf+WgYgmrajtkwtP//66AzdM2C8OBSXvusz6+CIHvmGOaZyYyUy6UR7YLFBCQ4+4OHrLatJmHo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8Lhx3KDvv/v71NoTP+8ajMYdsSntEWtKm3crBFWjk4OSPVXZ/
	dU2tVfqo5Oik4dUqWI1QZI5vUiK9JPLF2/tlOQlbVrzSUn5IAL1E2KosGtJsLnHnmoam1tRFeA0
	G2gBj/sqZdL4Ofj0hLqMiKV8fXNQumr/ko6EV5Oxr2hvlbB7BNzhobRxqsOf2Uww4BOZd
X-Gm-Gg: AY/fxX4zlqVXh/EJi6FHJeXtZ9jxEKMhbxoaqFKm7fYlNQX2//ZqQoNkcMIyh0wkxtS
	qMP4iQS4HkHXsdSj66oVOxU9FOdHG4J+BBv7/UJD34G+Gio+ztc/Whvtt6HyLoC5wescy7Rp7bz
	ILkzWZ7Fz+deo9vvXwk4ft3ipJ1B4PKGr/qbFflUKPsyvA7eiwr35v8Egn5utIpLe7uMC8VH5OG
	4vDdtG1SZDo55TIOSK9OmjDZdsG9er8Gn/yLyK6DoGS9gJQ/DnCxyRdB1bojsBCHk3+Oyq+A0Rr
	cezV1yTtr+vwM6bh3UupfHMkbBYwIgs3NamoRqYx7rUzONOQ3+sh5sojvgUHH/1dfSFeZQnMUMM
	rWr4ryNr+50oYs44dfDSDWHv9tA==
X-Received: by 2002:a05:622a:244e:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4f4abd9704bmr622880101cf.57.1767358216133;
        Fri, 02 Jan 2026 04:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZroyk4dZoidsvWCtxksXf5hWfSZlyALC3sJcR3OLOMElYO4++Ki0GmKuBczZXqaZzMxf7sQ==
X-Received: by 2002:a05:622a:244e:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4f4abd9704bmr622879791cf.57.1767358215751;
        Fri, 02 Jan 2026 04:50:15 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c637sm761217975e9.11.2026.01.02.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] crypto: nx - Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:12 +0100
Message-ID: <20260102125011.65046-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=32AVBjNIZSbnQ1lMFE+q5NxKqJrF1QCwSRIjqXPnWLs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78DvvtQD6o7HIdIvtmHcHAjqMVAIWSqPv3i3
 Hale8/Kxq+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/AwAKCRDBN2bmhouD
 13J3D/9UoZMNSE/VYBdydsfJ43pM4wLITOjzKZ5oTeVGEkzTdsY7AN2cjDZua8CboOHHiqIiLsa
 0ZF8UF+5jvY2s5zLLjNyiPB6Cu5RmpuLN5QFhAMeMc/09sQRWXuQoI5Vosg+M0yYPf9PWdVT4ZY
 fzIGgLS1+jwtNz5DxzSvO+WyyakRAzgMx5uD9pE/ONue3OuX80ZAqJ8+p9tccFfCXjSGl73YShj
 RptcMAwJ2XQ5DEMk0chQMNEOINakJwzzN8LL+eQCrJMc+4FGrzbO0RQVi/5/WhDFtQSBg8W+szL
 odaxqa1ha9hDBvjInvUxGsbnEaDPZLGBFWzMfUw7RYW5aVfciMFcPS+kOMGCqbOxufItDesuDCn
 WXuozb4uy2NSYLBFHccyDYzWqfmaHz75vmsVK7XIKoDLNb5xq99plUveK4Fvui/856r2nw14hPq
 XNitQ9fT4JyCuNWqdCZiM4XO+xyut54DRjYW/ZHGjLKF557xR3RzPQbcRvcIZBOOkLWRYXaal/E
 Eqno500XaozXzvAiC0WJ/3NxKj1lQUR3zNxWIW0xq3HETiIq8haORMK0K3ZDiwNA5SLNR7IGI1Y
 cG6oJBjBOQTifbe83+KI3rKU8ky0nTooJDYnZPWcqQZz4/9WdpBiC4FGmLW3rcLSYuxRrR7spd4 pLBCah8g5lRE7Jw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX55ax+UsRIdzC
 WejsREcbQiEJ7RSdXPN8ttopKAL1Rh9i3U1HCdbmXDVRbJtbeEc7jQNJw0BB5rmox2EonYxyQBH
 jv8bEbofFYUBv7/eEtQ+0h58nIvv/YAL/l109Vf0C8eMrJMSD4N+PZBblfShQf6sZYBgSnEd9dQ
 pCQKQe0E/fJLRuVxDtsSiuPLIpuxdyZEeB9DOYHTXICIv1rGeU9XjpoO0HeIpg7FS8kyCjTz5Dj
 /7MKf3onU5MinIkg/uRGhLWYgTxA+fqqdhX1ceM5VvDru6IFJ1UfCs7yoLnkyAQcu2EVcOqnpQe
 eZWNQl7ZqUm1yfkCXoQNSgKUnaRxhOz3llrpMqs+D2DqbFWagSlMbtZOAnaI7Q1KsucH25Tb+j6
 N2sT+K+u0U4v3qc4Lk9P22mh5ROTmyYxzYdYZyvF/NmsaO4/y6yYhQUTzapPFECw3fpin7yGSP6
 tVMBCcvVDslYfC5l8vQ==
X-Proofpoint-ORIG-GUID: jEFSkI5KyKgF4moCbAPuExd6TlIMT8aT
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bf09 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uaOs0JZUKPQsPhfDglYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: jEFSkI5KyKgF4moCbAPuExd6TlIMT8aT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/crypto/nx/nx-common-powernv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 0493041ea088..56aa1c29d782 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -908,7 +908,6 @@ static int __init nx_powernv_probe_vas(struct device_node *pn)
 {
 	int chip_id, vasid, ret = 0;
 	int ct_842 = 0, ct_gzip = 0;
-	struct device_node *dn;
 
 	chip_id = of_get_ibm_chip_id(pn);
 	if (chip_id < 0) {
@@ -922,7 +921,7 @@ static int __init nx_powernv_probe_vas(struct device_node *pn)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(pn, dn) {
+	for_each_child_of_node_scoped(pn, dn) {
 		ret = find_nx_device_tree(dn, chip_id, vasid, NX_CT_842,
 					"ibm,p9-nx-842", &ct_842);
 
@@ -930,10 +929,8 @@ static int __init nx_powernv_probe_vas(struct device_node *pn)
 			ret = find_nx_device_tree(dn, chip_id, vasid,
 				NX_CT_GZIP, "ibm,p9-nx-gzip", &ct_gzip);
 
-		if (ret) {
-			of_node_put(dn);
+		if (ret)
 			return ret;
-		}
 	}
 
 	if (!ct_842 || !ct_gzip) {
-- 
2.51.0


