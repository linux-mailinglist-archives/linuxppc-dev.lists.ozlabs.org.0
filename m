Return-Path: <linuxppc-dev+bounces-17024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DmEAjUXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB017361F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDQ4Hmlz2yFc;
	Mon, 23 Feb 2026 20:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837206;
	cv=none; b=VMIk9Mh31VaEHjlqCvBKXu9c0KoTYq9Dl6ABFbGfIIco4VDIKinhSx8tmmsQymF45zc+DsWI+60VDPBpiGZUq3r89gDP0N5sf75934babkWLTz6LQb+2mSnqTkQF7lZmKJVSwL+sJVrYkCcxM3mxOSHn0nzhWyv7flkNCOe7/uDdzwq89RlZCHP/5XSRNbzdEGKXZkG49gwSDzWx8kqcYXrD3pZYDuNzXNTndjUoMljBlbWaVqbfTD/ecRPmqhv6mwCG9N1Z8ZxQ+c1HaSJBGlpzx4atqfOIvZhqp57bncHCPp5Ha/IegAHHGQqDo6gHSGH2s/eE8iTZEBy2IOQhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837206; c=relaxed/relaxed;
	bh=38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H45z5K09dJc5RxICpkIJBUn6i13r2ldDt53cWbyqXn4rhAQaSb78oIcs8HlQwmdXI1py56mBBKtFtAV/LJRINhD4U3cILBiJtcd57eMor6GRk6HCmqT+82NvqMs7bQioQxKCy3N+t+XAui9vJ0oh7Rjnr4EpN2Fbdp219nUEu7Mfa8u5zbraYsKang1hNWKYBKwhcfcvRVrKTLAXvJ2jjpfB1c/eI9jm2PJFnTp7BdgmyVNxBgb7znFK0/sCtOWqNuwq5+Dx4wYLYyOuDC0wkrYC/S5g1ferEPIiuAOJ9Iy9G62ErtiteCL4jt8iDr7CqmHj9exIl+5y/SEGmJ1jwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tg0AiIF3; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVfIAfFG; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tg0AiIF3;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVfIAfFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDP13wXz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:04 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt6tg2001244
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=; b=Tg0AiIF3DpnZN9lg
	jSu+HUdQcsQA46DdYQF25zowRHyDMgyr1ueFVwVYVklKp9KItApydX3OGSMZZVCN
	1P6Xqn7BpbtokMvDRpZtEGx+oz3WQxEbvKGE7GsoQymHY7f7uanzxV7i3hTYXHXd
	pG76o6lrBsT9yEVtJyKjsiDWG6GH0s2NdQJ2qSZqJqjXGsuOU9yVt8O75/jN/dPh
	olb4fLZ0yWlBSvn/ZG++5MHsXt9xpDUgERHUQRr4AC8Rv5UdtFympaIg55c8VqlR
	YViX7pQTlpifsICf7TA87Gwje3tAus/QJPIUDrM+kMXMXkDiZGxT2I6YO8MTX7lG
	mPKrBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so3578917985a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837202; x=1772442002; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=;
        b=XVfIAfFGdarMlOtbVdza5KiZakhk6zWj4WpRuta5vMILqnqtvPBim1Wgf9HT/8ClNx
         2Grbpd0tkdeT04nw3jRHnBpQvYExqJOP28l9kQ2ZqSJcE6A6hWwWxxkkWxahD8Ey6Fm+
         pxKlreT7/qNrQzveGdC1eNSAH/oES7Eu5anViaKSNOS9Qyqeab/647gBN8kpQOK09ATb
         cqZbt3Ilngx1IaYPU9IPC1mslskqvnEbC8/xGRABGv1G7M5i5ke9UMlrzOcx6pI0LUOG
         JLQBt8tlN+bAfun8vtqJ3B0noOFCXrl22LmK4q705kcvRS1Zq0BC0/yn28SrtkDr8tEC
         C5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837202; x=1772442002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=38bdVP0LjiEnonGCd6nu5N2uiQsxQ6lpthwBP1Dr5d4=;
        b=l07r9znmC/X9YZEQdcVHdkvLkB3FxGbbZUrNT6uJ2TUW80q5weafZdyDUvOT3q2Ftl
         QycPt+ss8TBhTXfvuCNOEHU65XMX9+Uy54d9GDoVhQYXnh3wW044OKZKIKMCqdL33tzF
         EF6W+PN/32FHHP3ttqKgMbyeP+a5KLFXL2T8CalmY69yDb5M3faMrFsh2ZlA2EJVcD0D
         gc4LtSlm/Z7RO68srDYW59yCG5fRUwLJAL05XWNpAJDHfkOyZ60ULZNPbijkZrNgRyJR
         k8sAkyLJxxumBrwAjhYVW7iB76sH5BXJwVRWnIK2knYXyXC7umY+FHDdO0UwtdpPCR0N
         32XA==
X-Forwarded-Encrypted: i=1; AJvYcCVSQG/JSVtn5mCpgwso3w2X8RdEIIZPFl7wmFeMTd+prcCT9RaVrCPZKb3VjUKaoTiDRnhQm65lFq5Bu74=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrYOyzUhZjFzc5XjMAXbr1O3+BXjwjXr/qNViMl2SVNc5RFzt5
	U/QESYVks97J98ZcR5MWF8VJ+d/fis+PbnH3EhR6qgYzzQNkmPf4kHzLtN2kYE4GMGTxKX9sFQd
	F9rLyPA5gBGKmM377gPKb25lzMuOZppeO7OQytSanFFJiiquPUxDBV2LibK67JY3QW32qyODsjf
	7u
X-Gm-Gg: AZuq6aLuRrR8UN8r4r8xxszLmUjxhwv+amYXbIPt8Ha89064rna2LvccUsjVHbvwIzM
	eLB5WzTD+w4HfyvKRJe+QpvTSeL1+Fk6/vcdEGmx000SJRDvuU/mJeJOVyIbPQOAvxhI/XV7PMa
	jagOdl1O2NC9ROzz+Y8iu/7fq2dJIBWnhQv4tNX7JmtmySNhqgkMS+eUTmzK8NnQdCXVpjp3SZ2
	bQ6LQWJ1hGDNbo64tPsX/EaC3TNAaRREIzw7KeaZ7nxbKs9OsC/BuztlTAvzggC2pjWTHAdo7hF
	EdZoSLPi4tgANi2zHmeTO5qaF9lRBeOhLszk6XuYuLD6FlJQ4BYl+u1zAdOycRv+Ee7DaaCmIKf
	1XD0z7HdMEHuXniABi5odDwxE0czKPiEPyaSdsmoTycEkB9MN/3WI
X-Received: by 2002:a05:620a:460c:b0:8ca:3c67:8921 with SMTP id af79cd13be357-8cb8ca63f3bmr1096354585a.44.1771837201864;
        Mon, 23 Feb 2026 01:00:01 -0800 (PST)
X-Received: by 2002:a05:620a:460c:b0:8ca:3c67:8921 with SMTP id af79cd13be357-8cb8ca63f3bmr1096350085a.44.1771837201378;
        Mon, 23 Feb 2026 01:00:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:32 +0100
Subject: [PATCH v2 03/13] i2c: sun6i-p2wi: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-3-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xJEB6Bj9odQvaoHiGEJzfUeDb7GYiDUU1EcWkZ1ZOZc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb+El9mphvAj+iTdExBSZ+IP/iGZPwPhuA00
 vRc+Nf5L6GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/gAKCRAFnS7L/zaE
 w9SmD/4wTPhBOtKt0j+RPUskTVZdtH0JK9VBMYUc683qqWmM3CXiWDNKPtDD2obj295ceOfZJbT
 BaZHznrwPSH60OPKqSMb0EcA+6v3OZxO0ji/D8jUXtzK5ojUolm561LMDuCmuBY4BGuuXJeB3zc
 mUrkHwnDN9Ec+1FTbS/rvq48MKCOCJEvjXOjDfRYDp6Vi+bVQ1mVYsWyy3fujWU/MbRpNhaKlFP
 kA9qolCGTXeu1MGBEfiR1vm/IZ8mdPMapfsfJrFDwF6X8A9Wsz/2vuIvrRthYRVhlhNDpTRzkZ6
 YTrOkj0/oPerXCvr2bk9VqqBp9beL9C+Fp26zGrsP7d1ilDrnIAyRbXoRo2nVauFUwdhrnxrxPe
 NJNgHNwucUpldARXJy9pf3IA+29cXP3Xde4fC1ZoR1iOgLO8KT3EXVuR4RgzvKTQYCXBc029GvX
 GSmdnDBbPHAPv1rZenFEjn31bwPPdHNXj2tk8/SQziUvvfs15KMY8kufbA+ZC6ZXG7n6/iX8kbW
 5hhiXqYYZv9Nx3VyQLpWzIji3eq8O9RmaO6Fih8bczvHdFvOc1KixvzPnXbw3eO7mL3Zt0XxOpd
 OjTachNYd3ZxNAA+6A0D/lLMXP7pyWlEkAK6TXQ5KAvfTOL4wOeY/ZrQ0UcmIuPS+/Jslde2S8Y
 28atuyqOOl7DbnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1713 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX9mInn5qhfjhc
 wSyWNvq9dLSFBnNCcWotoaY8yLGGvjS6Z9QYhYW47AR4j3S6Q5+AL3OVOY/BxriFenFrVYh/sjg
 1gqi0uakDGPZy0gI+x7ZiVk2QLmw4RFbzZR9c+ItDH9EaFml1LcMcsYq3tWL2+gaVTh+F4TOpHc
 GmboK3nJ8ep7AlsF1yXBU1Gt3TjoGuv+SvL2Fn4hwoSijEqIXrCNHkCsGGNWYZ/rBIkJoJls7df
 ug0hfYI2yQUMLrO7rI3sOz0oagWjRvcatCg4Q0KplqHLUFm2+pjsJr777cYCf0A1gRZof6riCjI
 4HlH9Mowgic5cciwQxojGg0zzD3WICIxG7wzDvZuSwy7VGY4oWX9lYqc0dO3UK9jC4JIPqJOMv5
 vQ/sgImWql1++jNw29PTM1UqGY1A9vUTrWmxXFjUMDz6/JIIXbE41wnTr2aoT+/m8J2JyAbkLVM
 Dn05Ccx+pnmOdWMokJw==
X-Proofpoint-ORIG-GUID: OdRu_NKaS3YiTSwIwtA7YsBOP7LRbQ6Z
X-Proofpoint-GUID: OdRu_NKaS3YiTSwIwtA7YsBOP7LRbQ6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17024-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[wens.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5DCB017361F
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3


