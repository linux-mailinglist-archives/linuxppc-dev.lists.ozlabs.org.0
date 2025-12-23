Return-Path: <linuxppc-dev+bounces-14963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D459CDACF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:13:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW5551pfz2yF1;
	Wed, 24 Dec 2025 10:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486488;
	cv=none; b=eMB3kyX2PUT9pKvkHJMsxjf0ukPejEIpGkII/cQX4xo1EI3NZPN2mbR2crjyAzAyvT68G0fvjOfmz+RCPvFS25Enf+Zw/lU8RoRnVk2MRXO47Yyuwhv82G4C/DP9vjA9mrlm5hs42RmRpBkV1CXrJRxMzRz7tWmkpyJ8tYCphz40OO2XBwasP91wsfBg/mzKRNcX5+GyR+9RFjFnKcinUux8JWQV23MV0OKpPWLCgAedncYsDX2kqwBqhSbog5L0+rdb3BQEl3odu8UzcrseBznp1r93m1ubTcgduhtSAqV2UJBGO5uu0NskQht4nL5Adp1BNhiHbVPdnBAgnEM4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486488; c=relaxed/relaxed;
	bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpyGx+rybghVjUdvEjztO6UYC/SmketAZ8pORkVCjyOkzMXElEUxGzg+S2E7q51cxh4nfndzcvvBfaPOwtOY86zGRbZNtCBH3mpbAR89dZeu3SWaz04E4gUcPlqFHiGTjHuGBquT2dlKidx/gXnnpYdNi0y0sIO0FPx6foSOj4unT+nWZIYsgOd6/vK37pPd3efP2kGpvvB4anPw4ti8T+4JtyqcUkNshLi4WR01fz8EPktXxxp3pUOBRCJw6CwWe4p8nas7I5YRbmJx64bjfcUGHMh/ol5iQ6r3/rS0mX07qEHN1I4C/GyMO//33pmNHgES4G3Pn+vGtyAGZoeEKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOWraz2T; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfq/JoVm; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOWraz2T;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfq/JoVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBPz4g2kz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:41:27 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7BIjC2115377
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=kOWraz2TOCazDGf/
	xFaXszmIsPaHsVx1Y+SMk56kvHxWl6Qswq2UjwUwluKU3ZkPCG62E9lpmTNLi3La
	zkIIRrtamDCJyo3PsxPo8BKCV1Sjsw349P64AqU6rxeKvYsP7w3fT11QqEqVxg3r
	xYjd0kq77VhUBsTiiBT5D1KCkQvRQAg92A+Qcl5Xd/O0eFo4yRZyivy6QJqVeyiM
	jPwpntIMRWc26KtwrHcIVgwSdXpEZP9w1XV38ycO0t7cWYZ3nqgnJ7ynd0Z8Fi+8
	bgj4FxrIz26xWlDvCI8QlRK7Lm7lYQBjXANqdf9J70E/UUe3jArLPMO/kdnpOIbk
	J3ygjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj7y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4ab58098eso105454261cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484173; x=1767088973; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=Lfq/JoVmRRyGGfC5g8DOwKwB3w5+HNebBPNMc8DbMhj9l9md9ZmIS2qXQAfRf0fXD8
         B1uOEjhcerU20WqxXJ7X7NgIK2jbIjcL58vYOdGJpSi5MMGp0ab2gCymrxEibonRS3Cy
         jwQ6QS99O4lEdOiP1hherZaxXQa8ckDBczJ9kWUE84IeDqIDisCdwd3vu6qgw4/yRRa9
         5wg4HhmAXmpaKu7raO1LznersgfDzlYse07TlWGt1Mt+DfgTn+oYz8EXLadC7J5KQNyy
         pwlB0JVFASymb82JekYknZFbS59g7fLSLaJye4Fm5fz5S3czCbag467y6rSCkQ7EkHYB
         92bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484173; x=1767088973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=lP4E8v0donSAQYJxRlfdZqPH6WrXlCApsxosItUTH7tdNTKRGAeHCiqdcv2lu7KvaK
         ooqS69m1MNLqUkmunDNJ2pImTrr4XU06Qk2jkutNcKdYs+UaCWAv8BDHn2S0kOKDJmpU
         s8eCi0285txEd40vW6qdWIJaWcPw6oBxN2hbJ6uFtItjg+dmXwij/bHqoWSfvi3FKfj0
         2f81TUWYpFzCEdI9UFveWHDn+EfrQsUVsCwr0pQLlEanN8XMO6sATE2Ndl5Uso5NZVyr
         D2u1QgDyGiYToqF+0iDz364dUM5/GHqmLByqeOnjhq0as2l1yNoCamhLMsxQTxgI7GdJ
         KtkA==
X-Forwarded-Encrypted: i=1; AJvYcCWuKCCToDEQkQ/1ajiBp7XsyHZVoQ3d5Fww/0+FTdlgHGNzXE8SVShM5p2PjyhU+OHrROulmOnSZ1ionI4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCxGGdTHyn4ZuXYHuBwLmQGGTeTWFR13kMGPJiwlGZ0ZdtWuHJ
	5LrW3JZN8AXVCEKmXh4Tl9FZ0uA9lS3oyYaZkBOcVEJiJuefvS7vE74cwWZvt/dLesRGqyP11FA
	+/jBQ8HgwEluJqXvFmAhHNIQivM43mmS0dXG1n8AAxY0YAsDspEMNfHzuqibnm/I13hBv
X-Gm-Gg: AY/fxX5rincB2FOLjxJdrCaxvilfHL5zmFKrBs38vqGDfZhUDqxWkQz6QqLCL+BH79i
	MbWsp1x+JKdMGEupC18hoJ03B7WxDmqCmxYfoDNvVrPhhJoD8e3aVoGFL3XDYknqtPdDV5RxllQ
	ZBE+Qvjo+oCjTiZaMNeqbZbD8CdvHd53IC2z+hddq5L+K7Noi7hpBPXncB80e4u+AnlBuu8fltu
	CGsiXeY/iduzQuUwhZobNhk2HmWloZ3Pe1qUU4KQ9V5Bb57nVIVSXTAR6qbPB5um11L3RW5UZMH
	uCaIK+6+XNzSJBVQrXE/VW/YX4YkMuIkVZs+6wsYfxUH49rSR1auvcSWagUGTGu50qGBgPUqi+c
	jO7jR84uyBs1TMSvViHa9BPHjhWax8vvnGM8o9A==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062921cf.17.1766484172925;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxU8ImwOEdXoIYf1MsM9TeSN65+Y/YYSiNRkoIkd0saptyh7UpmC8vEXV7Zyr4GO6jy06A4A==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062531cf.17.1766484172477;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:27 +0100
Subject: [PATCH 05/12] i2c: ali1535: use i2c_adapter-specific printk
 helpers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-5-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi8rAtrAU9cEajonJovu2JYczyiZGMkrWxDS
 Y5Jzyib7tSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovAAKCRAFnS7L/zaE
 wy17D/972dKE+ZfFzABiKYPVHpMHlDBeQ56KuVbzVhhUQvh0TJ2053lqVMHamKoPDvLT0rdTX4A
 99HxmF7uBeJtK+kbQ01Bdhmq9xHApLT+E29E37/AD2kEmDiqgh2pTnK/6jzrt33YZCho8x2JdmP
 FOTUzTACynBfyD/meIOwFNVUlG4WKdCV5XZDwe/EafvWX4xsEE1/NnLEWfwTVWIH0t7neEk1i7h
 zs7wBNgyOwLuRvCFDyHbW8Eq9uo32AHlKqIsh+FuKGKIhA4zqXstnLmuLRentmZEf/EiuAGr9Af
 ps9zEjpcLXnUWlm6GfINfIZvZBDiIMnd8wl1uhXmlEgM4t3FUJ7fwY7nQaskSu9FlHvdC8KMWBR
 ogcRWdUUbIXrCWw55dPDVkZoV1xrZIrrTHq/HzN1/8GZBOZ58mEZsDyGAM++a0RPSToPBNNfZQh
 Ols9ASW/RvRWlQMGgD0AI2ZrcFIgp2di6iLIqqxyhoHMo/1/ZdutGyPOVAjBXsU1qF3WEWcBSy6
 0NQm5+X2Dw/RlYAbc5CP+CuusHtIuMcUfaAIN9rNbvvB0FoFqg+0++Dh7dKod4k441yvjxX8+aN
 iNjR0KQX6Z7yQJY0evDEofPKrBoN3VRupLBzlwys3dtpohLH1tkLvUxD4YuV7pXe2m9kX4AIPof
 LVWSd4OC++9HVcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a68ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ar5Cs7xjfX-TjaSYiGVbnbCcBzk6ZzE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX55GHPmw4DK9J
 MfZF1h+Sli7q6AL5UgS6khdKjnFWLnuXYhVIETvlxyP4ky60EFLTulNmPYGQOjK/T6ckDExhlVM
 v9oPBjyYiWh6nRBbweNBa3xpTbv7/wbRHKvqfTB8ElypwkWYUvw5XSB6j5Gq91fPZwZ26+pAOmT
 OX+Ts53cfdm0gN1LXNGhCtpx+hLMe+eCRthfVGWzINty6NNzaRI52utxn0rXxTeKyuSlr3kPzKt
 l0EKkkECzEpA3asskdhrrpOSM4aGCZyZNDN95kdy/fd0XUhfuDXXUkQaWAHiVNI1UkMY4DGWyrM
 +iwq4sNAirtmGJ50YfJcGLZVSJEzxbgc2B7OaK5mZ9OWyOK1iRweVbJQoMAuzx0K5OSv0epxe0Y
 1wt5v1J7ULc/Uyt/sJ8OaP81ekeS2kr/lhnkiuhH1XpkfJnitV+Uz36Ys7hLAoP++5cQ6Txmy+R
 d301eayJZF6/M3pdabQ==
X-Proofpoint-ORIG-GUID: ar5Cs7xjfX-TjaSYiGVbnbCcBzk6ZzE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


