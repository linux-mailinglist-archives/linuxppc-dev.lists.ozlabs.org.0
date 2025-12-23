Return-Path: <linuxppc-dev+bounces-14972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C6CDAD1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:15:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW7t2KtDz2yYJ;
	Wed, 24 Dec 2025 10:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766484545;
	cv=none; b=FGuPWIWMn2SGWR20ULJmsRkCN568BxkWDnZCtyzwvSwA7aPsyOTng5XQ1x8qcAVo0ZhFOQEAa3cm/+SKfKswiyy445w5wgBlsrAMn05eDV4dz7RxOt1xyswAXYsLFblLlmZGvZsRudA00ad2/P+YjgPnjmITK3LYWMdppSFvLYcEC7FxWugoEVLTrK4SFh8R1gh/KjiCSioYxmON9voAeMaNsfUX5505RjfFwCc7Q5QnWuhfSZZYgjpP8DpGZHRunV1mZdoq+FzLjFHERrJPhKYq+8KTGQ4rECjentZQcFnDzZV4mZVNRGYsIs8msTrQ+d2MyqXRz9ShTpvppqUCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766484545; c=relaxed/relaxed;
	bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyN7lU/3usLM3bBt/1ORiqooydY1bqWSmEt1F4gMUXQUr6tpSkiumtMPErufrHVqisOilUUd+omeQf4OVRnbu1DqW4BDJK2WzcZkvQ7VzaPS5jHexA8dOYxeBdmyFk8uGnhq66y7S8O9X9mivAAH/Z2zj/DiFDh4GIqV5Vd5HUSTxH10Y/mAzRtvTD/4Xu7RcuS1Z0nReqBddgxeDE75lH+Vg0c5MWJ8qOvqZW9ZXW8tKuWflo3wQyTkPS2xFkiWIopYk7AyDxOF7Nem9oqvAqo/A9nqKlAuaYIjj9qtrkIenMOLaCAakU4uD54cDGBiN6pddTuYZ22gRgchS7diQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bIBBN9gE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONKEMJe8; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bIBBN9gE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONKEMJe8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db9hc1QPxz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:09:03 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9ur802041298
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=bIBBN9gEj819WWSx
	ukr6MOHNbMcO371J8nAzeNYa6kAXDXdyE4Dg/KOTsXaUTl9qKkZkGyRLFsanbFM7
	ulRV11/8RRD9xGHJkL5via2oxM8bV6+tDFtIDXmq/u97zF8aI5SlLyMu89neCMDG
	4+G1BfRsARTSwS//CvhRqWHZi/lbX18qELxu7Gulg/+9G/jTQHbcFHvI3sSUJbpu
	F/geqQDiMKZYCvIorg0sAQNQOseeeCIphl8Yf9Ax6I4JQuaCniTsMznNJN5oeS26
	NkGkG3bWxTuZe2B7WVeVjmr83pKepmi4QZzpriJF/ENOpl53lgZMfiuxGK9Xhcqy
	0qriWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkay3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35f31000cso67818071cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484176; x=1767088976; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=ONKEMJe8eUieB9bvJ368sLaAC+NlbtnyLc3aQDZrUA20728pkNdVHEl/0kIM38y2PT
         YgM+t8wh8vZnKGOw33DBNJsVXIJX755663RepI9jwhoiVQ5UTnwLgPuUVzB5Kk9itrDU
         fxa/7zPgjVr2EOZWEFboN+OLJr+Eich/3NTWLALon8jfUQhWM5JMEUsJhkHgb1DotFK+
         ePaoTbeGW3UrXLPTYgtZT4aglueV/MN9NW8nBa3OvA3vNrZMZoyA0HWgxiPpeY58pc5w
         HLFHCsyoA2JU298v2DwOaDvgNG2C+O7ud+JwSRpSI2sQaCtaoJGC4WTGrhhSCbMs6S/1
         kFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484176; x=1767088976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=tu6LLUC/1ZOIa3gKK0PTcdBYyG1+elJN38Xxg+h1Gs8dTA07n4kvH3pfE0GagoUkCf
         lKUumBVpGhPeuo3wLFftLE+73f/kTnoZCKcKwUj1Iy5QCvt+ZR6tcjXZYQhnvMSy8qQ6
         xv1CXDAxJsdKj2zcLhi1sEchLrGa/bkrxpQFtJSACleOSgPAjUhSAv2a4qOw10NA22an
         myNMmG+Cx0RYJT299g7+RqtGQ9LHgvMrZ5i//ye5x6ngtR26ZdYCXHzWx+9lfuHU5QDr
         2ixN8qRHFMFMgJCJILii3UUtXljPNFH/4KjB0uaCqVTHLVEedvo5Guv7g2c6fNZRf96a
         Xi2g==
X-Forwarded-Encrypted: i=1; AJvYcCXOHDz6vz3Sj+lpMGZDUmZDJ8KqYLmevYNKDv29UtaFz//I5WgX65WXxJfIxdN6BCKe2c+BsxmIswaCXlI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCP+WvbB1VetXoTyGPyZf/oPrmNLwrnE3ZlGNDMIMDIXd/X7YI
	LrOq0wrtTdGyFO582c/ltUhXKCBthur7fLB+K2G67kKaiAvrDEGiNCEYskKLq5RJxl5glAo3WKS
	8T0yn0X9MMrWCN2aqUWmCU21L2yHswydqkswhl41FnN4lrzVRDD5tm6ThPOQeHn/aSu30
X-Gm-Gg: AY/fxX4RIYYToB8kk3ccp38cWkOAi73OYM/+hkVXv9d0ZN4um8SD9NvfFsVPrUaatLA
	sNvqVYu6uiDhO6re3gFU0EY2pRb6gXWFE89D0yYIFt4geEZeKZ5qjIcRpNi8dZhLBTY89wjt+J3
	xUM050PcisMaa7YEzqZHZ/x5d/macWtHfm2Bhx1gAI6G4I/Nsb2/PKbnlid89DA3YqN1Sg57Ncc
	81tl00pun8p7s1BFo8n5KBdjtyJGaXhEXL6zYfKEhMlPbW4hsV2dhVu5zXSVE706YsRERRkPIIi
	233RncJTVWhPe3hmJ71RGLsM7VdkIJOLNboxS63rJPrjEmtipbI7NnR1uzDREWm9KbDTxYdF3KU
	2DoZO+jQRN8o7EQQaM8QzUWYms7A5/I/t4fq5Hw==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207318121cf.0.1766484176225;
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZUZ2J6IwscWcY7RC74ES7QnMTV7pkYZ1I5E0GX9LHN3najl8MNqhxo5VDEyhUmehwO5Tzg==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317561cf.0.1766484175625;
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:29 +0100
Subject: [PATCH 07/12] i2c: ali15x3: use i2c_adapter-specific printk
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
Message-Id: <20251223-i2c-printk-helpers-v1-7-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi+az3h2mjkdy8JfZt/+vwI7gUUYCdcxe1ji
 Aldb5AAaUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovgAKCRAFnS7L/zaE
 wwg1D/9/TgJ7+cyyriM7piIyunaQDjTvaDw+EBEL51hFHlX+lO4/jVLy2woMDI6R4fIvrXdW6ub
 Jpy8I2sZt3jMNDjOwoehDFb99d7nU9UhuOIfHRCrblhzfjt5iX1W+Qaf1pwx0BawuEPynomq6YV
 8YXynU/1S/jKFPWKtSwMhvDyUfo2IiEuj3+gmgLsn7gW5CUydnE1u2dyvJPDUz90YLOHV7/RQBg
 fDif1lvU3gfyFc+J2P/yOhXn8Kr9DkrvqIQyYJdfbes6fDpGhgG9OAIUUHhhKpTjuit3E9F9wMd
 FtxMUW3JOIdOouc90ODz/CCxB/bn3qYR+bY2vynlawaZQAFsb+nE33QJshh8AMF9esfFhUjNqQ9
 mebGDH5BMjgjuPJCLwlPneIN+MXg4aJlY2gZySYW2vtrMOreqUVOWaNaK/tECpvg7zY+wu/FNJn
 OtTNA7guV0cmbQHlOXLdjzKbklatBSK3hvb+0TUjfcli/xb2Wbpkvz1qhX4UorxXc7aW67O+Nh/
 K7+rXBRV+/VbEI22DeQ7FRSUA0shc+W1WZKDV/M7RO//k8q8g63p69ixoRUXzIqiiDjsm8oPizV
 thrGUnbGDKbK6jTyCj+ShJmpLpL9LIJ5RPRtEbMachuYbTpfqO0d0QWI58cXjGgllDLPJhR4Oxr
 OY84XabOoDPMwvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzOlbvJOg8eRt
 hjjy+YFd3Ay1/LkskT0AKhq0SXWrnR8gT4ONcHtgIRiza7sf2hyeZXUWxQUWnzN1XcBE5XgCJwL
 DoQtuDNj/1Njj4WLTp6oOOw3H5cbLBcTxvLk/4vEm1WW0TDBwkQZGehOEmvG7wzgXchNJhILOwK
 nKJLpnh2LI8z0jD5pD6lp80jJNc0YAVMxhQX601myEXSn95iwDxqRFfhpZPKypV1lVMDx4vSGIE
 IffBfh/HT8+9ZakauaU+J91lW33AxHLgiCIh4vjUzT6JixTk5auJ6Kuowb9jTbXAjlh65m2HNnz
 82hIK+JMVqL7ASrZdlv6U6s1wBUwaWUidgtyee8YFKNcKwb/4ItsvXO1pM8+sD3wrMxgx8z0nKn
 yWXDrLk6F8TCD78mHQ7HXMa2HRnhHr0alblJT3A2do8ukziQUNwYVrCpUfolfzcuKP1HGmjNSa9
 UUKOl6KEl5mXcv3+yZA==
X-Proofpoint-ORIG-GUID: Pr9Tw7huzqfT984Ynin7vcYWbZuO3RDx
X-Proofpoint-GUID: Pr9Tw7huzqfT984Ynin7vcYWbZuO3RDx
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a68d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


