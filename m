Return-Path: <linuxppc-dev+bounces-17027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NPyDkoXnGkq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE2173654
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDY6JM5z3cDV;
	Mon, 23 Feb 2026 20:00:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837213;
	cv=none; b=nHVelRDZk5Bp0K9vJ5Zpgmcm9iLCnjxvtgM/uaMqkxDmP1Hwz6FqXlkncOx3Df2ktVF67bR6h7mV8ram7uzn0gvMqQvYjip0Lx0+NPYxooXFWDXfVC/zNxiGskc30lnDEeTnwskVteWy5jHSr4gMJ1vPP4qnveO361VXL9vWTIsWdVFbxQZtw6nB3FJy3a55qVh4pvZWrfuejjxuQJSGeONYJH5Y3pU/Gprqo9LkALN5oZQ2MYCIwIPwRFFJoYmqnxhciZqob1RaCkf5Q75EStcXE4q+xXf9Jz4OYTvrjGp2GS/fP5S2kgypUpeUiu5OGuXddLQmrdsuyzgbHTxwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837213; c=relaxed/relaxed;
	bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xsm36TGFoOGHF/3QsWf2Aeu7ST+w8ABaY5wXgFomyAD8l9imCcmJyCf50qryspTx4ILdMYXiJhM+mxsffU4T5lxBPOwZ7wVwWX3Pd8dU1VxV1o7YzFN5SMgrr50IPnmRXs2qtRVz0NOj4y56JZ5EwShg7FF8dz1czjsZTqa39CQ25PBa+MUeepzNbo2gSOSj0gC4vaYEqHiRDfCq3SFRz+VpkXMQ3Cjkqy5mbWXU2f0dIePMlNdZ46th/qKPEQPCHNh7YvUCE42E/T0/ne/8EGYaPJZeDEaPl5qEgCJ9bowWOdqc983vJHyTWLaYiZTbJ5NuUhx0RRIAVfVTvpH9Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eVF9YC7w; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kYkKX484; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eVF9YC7w;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kYkKX484;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDY1BF1z3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:12 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJgNRS829136
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=eVF9YC7w6LwSXWPh
	KNjYpPPqoIYhzE9ED3GDU8Wv7tD8JO5zXzzjCMB83Ee3Sdy6RfVL80wjLVNCmQUB
	cXk28xdHPXoFLnBxE7K0JK9eo5rEjdHRtdVmo76v2RLhXTs3PyX+bvLi7XOtMTnB
	W69yd8Onuhn+DdiL+30cQEXYzCTAtCQdjPxaSL9zQmSDFXZec2/qELgIOV9R8kpR
	WQLH44Ki6glnjLGV0OJhMOSYVEQbcl3uLTBSGCatKoLr7QwfOZp3Q0HNCIccc12L
	Qf4yIqyl3EFogFaBi85g8nbHNz8xX8S/aAf3bbzPICu34VOFLdHIZMitjBJOx8h9
	RhmmyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m2b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so590638285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837209; x=1772442009; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=kYkKX484R7oH7wpzJ3oOyJnrBgacxn7tunZ4o3qQECSH9OhorsoJADhYCk/S2QlF2m
         eQmMVz3fJDGWsNKqMaL0s/1qe1EwrUXtIVBLyIMgxawKB7UhI8SeU/QXi9/RUd+wjlnW
         W98U44kY+YlnkJsTE0l9up2LqU49xfsKFoUVqWiS+lbyprzM6o/QwncH/ZkQymiQyWoz
         Pu2cBJ/8kHCMy5HBISQmOO4XPdxCXzTXmmOBMTSC1kkP4k18vZ2yIf3XaXy2pN35tpjp
         eWQ0xQnz4jI/vAO9x+BEAXMNhaFP1WCu2NpYiewluDm82dMTI+xDrmjnqHVnq7dg6WNl
         NF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837209; x=1772442009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=V1vGAVCaj9sWBeiW/8fnnnN6LWDU6f+LrvfhsqHSAw6nPispqhhkxUz9fDdodTqryg
         CVVP37VJb1shEAv0v09gVmGJ90P8kh+QMPz9rAM6isMswM/IpZKoO1OXw32WK38+4DGF
         Ryky7Z7THN1yw8GcDnnVoyvffa8EMceySfaJ4sDKxBzDmWfI1Sa3Nahqcn8Fm8Z9MT6y
         brbvAah1xhkBGcrsxHw7U93eifxwvqdk/tJT9Ih+AkUDhKwDalhUoLFcyJ2/WfxB/Gxz
         nnt8BAlb3sF3h7R4VmC+lsPofi8VKCp8/H5q8EAu2TbFa5OK4+Ihi3qyETCNQ0svmxpx
         SSuA==
X-Forwarded-Encrypted: i=1; AJvYcCUjaDYpg32V/+PrlYjOLr0stFBSRDdd4DHfUsNxMvApJTmIC1LGwcxnIvs4ro5RZJhV2ZTQM/4YHSttQ78=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlDPl9bc+d1lm4kAYbyga5CwUuc99Mf7mHn8BOjbNQdmxuo0Eo
	v7ldepaN0Gq3BlZkx876Knn4coZTS1sDZx7FeDAT3XKDBQNwYHf4VqSgW8lL5TGwL6ZTh9NnfKN
	5ueKEThqxL9MtofxB+ZU1K2dUD8szOV6Tfm0RUzTcVAnrQRDYNESKfiIvOj3rxdPQjoHnCNglQJ
	nD
X-Gm-Gg: AZuq6aKCEWHncXtVBN2G+I326RXZOwfgao3fuWalIhx+VTtVSLjoWzeL6EYqYRTJAj5
	hO1b18tOPfmbT5AZQc1LYP5/n+RdXsOG5IIJWCZais/gzljLaFDNT037m56Ezwoa7K8bx9o+wTr
	+zHQqIToDwWolZs+vezM1PGIBnQqjgy9pcQFj/LrXwsfsyyYJrkz9l1BZA12HsbiqTfj25bd+G2
	CXWVtrC0bS6salWJKSbf8bO/obMQEQntBv7Ue2Vxfw5wy3rTR3J1lwed+jekCeZSnFvaT1Jmksn
	mEBlPWT9di8JkIavMxBD70hxZMcNv4s6B0NRBbxxxTwZ7r1yYQNNT9MpVex2O6SvYGYbTsqdt1t
	uZRzGepkFYtyvRxWuZkue/uIdQ98VnahKw7WReJ/6DoHGLuS32+/r
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901115185a.38.1771837207916;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901109985a.38.1771837207444;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:35 +0100
Subject: [PATCH v2 06/13] i2c: ali1535: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-6-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcC9bXEdP5Sn4fkg7K34tcVggPIty362en86
 2bK5yUtOsGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAgAKCRAFnS7L/zaE
 w2HnD/9dfwrfuwI9JNyaou0gpSZMKALGt6siXFCwiP5v/VMZFa/ZAbYQMnscjI5Uj0upHdGpOte
 uqv13A9Rl/BBSCZm8v/xgj3mjDQl4VjYfz5ADx5CIRpYUQ/e4ytiY3HULkih/OqsNCi1U+xFrw4
 DmmV8F+k03bMBYhCuKCFZpOpH6JhA49t+dTc92nci1Bj2KgEmD1gX8vfZDPRnc2NxfZYEyWO7Mm
 xBOidJdFnjKag2twYtSUYRqpFO010jrP7usg4Vo5UIhfQvQESVDdvHIQbjSre2JCFw8E7aJHGWF
 byVagIDoYVo5MaIy7ZYzn039rnGioGGfd64riNEyG0hD/lrhIzw2Mhwx1oRRBvWPvve4I6vVD1w
 bMOV+YKP5B9S30WS4UCFmmbg5Z6hmXmYj97F6PQcOLEcB6wt3LHMrpxAjd+PrXwFNdPrqS90dX/
 NEcWQsQhTHwZujx2SmuqLDKGnyqFG0XfZzQj8TGu7UnuuhaiFGfhnwv59lkHlilT7BQ/Uro8IiX
 aLvs0jmh6qbDD4u5dNWoK8o3PycqBlZHnhJ7q2uxdJaZkLYYs6TlXM8RXYi4NIdN9ssO0yPzC8s
 W4YoVNx+K67HNjCvGGJlxEEi3Q6cCeWmYwcMbtLleh5YVV7W/SzvJpJUr3RTY5jhFuvwa3IcUxV
 rbVtGFew+m/UCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c1719 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX9JhMs4xx5NGl
 mc3c3Jx3G8VXSqZiOMt+t1jyif0vF7USF7ZwCXPbf4ar9uZltuPMQOItWkC5g0XiRDbxYAceBXW
 r0m3KsZEqGLuNba7PP1qydkjeNnDHxUXTLH4fXTGHvpxpFlxgX//XfIX2bc7DsQ8DIjwrjEVGEQ
 4PQO3/Cxc/2hwgyAjMZy9JICW6MjyP0zf0WCcOwvZzKsoIgBgAtJUCFAiQqrcvmVSTv/OhfuAGI
 pyZ5I2a6STxMuu2kQ8AlxkzOxtNE+VtBR8lWlZLBBKnOhUzPaqiR/uwyuD1GedO12SR2KUfz7bm
 uyizrr+SXff3NOdAbojS4aORXA+HfQE8j7N+I05AqgbatZaCB9dwl73Ps0eltl0EZpj14VfzxeZ
 qkOHC13tXtdvVHgKkXm7Y/y7bJqnKbmUosJjWyfUnniSYUFwAW1+g7+NdE21vcocrOYWzShorYK
 UNOQr7aa6dbfI6/arbA==
X-Proofpoint-ORIG-GUID: tf2yncMo7YiL7zCfPdIxAB04FCB-7PLZ
X-Proofpoint-GUID: tf2yncMo7YiL7zCfPdIxAB04FCB-7PLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17027-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5EBE2173654
X-Rspamd-Action: no action

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


