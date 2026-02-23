Return-Path: <linuxppc-dev+bounces-17033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GZdMn4XnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FA1736CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDq43bZz3cMC;
	Mon, 23 Feb 2026 20:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837227;
	cv=none; b=QDV9EWqWPBlAxKzFQnU9NXQ53QE80w6miKDAHFvYmjsqC/5aIvn3/WvjMrFAmRN1i5Co48eLdcpS9tZh6DD4k3zQuZQkhiWwQeeNEvKIJqZuT7E2x3BBsiKy3YCNfEcICxEPj/mPtfz4xiSZlx7rO0lDflhvDAUiI8UDBniamitKl/XU0s0ZCSWybhFYMLN0TUrJ2DVEeDPT8riFJmH6KYw0GH5d/DfgSJPkML46g88WKxibStVTWWxgaZSrb0nrrsNy3tlPKzQcP4sL5E8i0nn689Dp2S6/j34ASqnA+xGE85jU6rB7lj3LC6V4+mefVcotN54CJ7ZaW1dmpwhfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837227; c=relaxed/relaxed;
	bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVyxkh50/B5mizmq4hK30pE1VaCovztFwuv8wQpO9VVxbKaaqA1qP4JXTTodo2jvj5H/bLPZI04X1yY4rguHG8fbOMHXPDLOXP0Qf62Q7ZHYWmGMsG0CX/OSC1suGSfbQ97XO1+HVir5nfDw0qkLDviypMFit3fhofDHgh3Wm201VjAS/ptSeqTsoU/07/DBaYGG46sSw02mC1dUpDc2PQ7QbPZyRzFhP00PHlcke0J/HnF8QWkz5i8s+/AzpLyRp4pe4cVeoZ7w+YhDdpMI/uWdyPonW5NO4Mhcyo+v3sbXKhQ2f/ZKi9sFgvEbwDWrMdFl4mtrU4BNKlnGoDLOqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwlSGsPo; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYFufBMB; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwlSGsPo;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYFufBMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDp0wPLz3cJj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:25 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLkP092108750
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=NwlSGsPoajg1cdlN
	7FzImz3K7gmzTZflY85WSUFFFjqKsV0yoyy9AHVsFMHPRdjvX7zEz4bKOz1FdcrY
	aXWZagVZ5ZFd2Z8FuByy3BgQuM3L4E+3cL2iEwk1Or8o4Hl3TBZvuLcAf8Al+GIP
	gbbubkB3pBEdfiIBubRvwcIdXXX+X+sHj1qa6ABgHM8t+GK0EyS9xwNLk9cg+YYw
	cqeSfSWK/1rjya1QyF89zZvbxZdJqxYN4d08FAjDFCkN4X13IOMkNcA0FbpHWbqu
	kmDGlwB+M5mfh4a539DIBSjhclF2NtGHv9PdOFxL+jQiRY0Pogby/kcckwwNoiz2
	6v0j6A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukypk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89467edcd21so221440406d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837222; x=1772442022; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=PYFufBMBrVj5r4qZBJFAUYzgG15fTak/ErFmpr6h8Dgcj7ghRQtegma6tFXr4j9tJQ
         Wi2rLnyRHw4mL75cMmZ7vUgvA3NV/8fn8F+Vr+dOKmRefKcSXazqgm0XGYk/VcRS9ouy
         TIxrtnT5ZJfgiu7Envpmi+mAjeGxoW0tPm3gl9t/Zypi6UiPkJAWLs7na65EBd+toDjv
         cjmHkta82cIrumL7uhUEu59LrHlAoYjuN8Ho8PADpC7VaBQHzCAE+U13WzqNR38wO5w+
         wqe4zH+XFm/FQTh0kk4Xu7Lr1k6KGaZovsx1kHYmtlJCIGTTHAeQA9KrioL3aWVmnc0f
         16ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837222; x=1772442022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=q+sqU4inyJDA0wOunTTNsw1pW6w/gABVO5UHR4LY37wl2PnyaZEvlvIAQuql57+EM0
         b5fHVpsP2bTrKVhx+PzqbDBHXoQwxtUgA4DmLKZDqZUScbodQgkFf5qrsX9Eq1SCMbgA
         MxuYXIrzyOuv/U4puQ3pLg7F0Xs8dLDV9YwkfVen8TZtaD/C3X0IyLtv5UG4IB4EyDpC
         vekZBOt307bjU/FluCXk0W3sNP5sCok/WM6roiqr0zAH+BsXOWHkeTnOZjjpR8tgzzXQ
         JHywi7oHDoHWxYeg4KszL+mUsEfndoYLr6l7CrDjW7RN2uNqFQx5ctOM6CalJ8mSP1Tm
         3KWA==
X-Forwarded-Encrypted: i=1; AJvYcCW7qP0AtvTarGG94tWuUG6mEafmiTS0rxm2vV2QrYw1o+PoFCV/IosGw3lgCeKfDCk6rNCxJZCIqttBQmc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yws9M/DfjGGK5QtVozaIw3LU+7gsbuz2nrj1qGKTc10PtbJkmlb
	O0gJ8T39UJZzq+GXQH1I34kFyEFi/CEfcU+j3rK5Bki2c56UHmgD7Zhc/n9AltTlXPAxDxHO2v9
	Jfrmgq8ASEKmwfwr0Mv/d2vyl2h/x1sdU5p/O6VhKzDkM9bnYfvTJBhau6+2u4Rox9VGbliHkWj
	HU
X-Gm-Gg: AZuq6aK8RzeEjtVgwu0/z0OGX3tg3Lb4v2x0ES0LLnCMmGtslLpZJtcBvNQH63dTNYg
	TVf7K7D8TfMI3i5eg/7f7tN/8xnflueviYYyhQpdPsdEdmU5TJVTsHZS72GHX1L0uoCNJeCdYbO
	zdaDhElVa8fU8BLnQFwe8mdem+mX3IeA5kKwTVjIuQKzkOcAgFeuTHDFw2bGvJrmTF/CEKz0Cd1
	CsyHcLlrbXr3iZzdN44HPSc1QDCk54a267Np258JWB87/YHpuYX+RWr5EGB5N+L3JBfQtQwD+QK
	G4StmMa8qCCbOaBQEg7PLExMI1sDoZJqfK3kasg0KK6nJlZI24rfW7Qr9kyL9d0LP+G9gsQjlyE
	+LJS7ajaR4t3zExcrHT6MzXnlmFSn3T7GaRtWGazCiN173FMH1TpI
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991089785a.38.1771837222294;
        Mon, 23 Feb 2026 01:00:22 -0800 (PST)
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991085485a.38.1771837221857;
        Mon, 23 Feb 2026 01:00:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:41 +0100
Subject: [PATCH v2 12/13] i2c: amd756: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-12-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcHDR72fg/RLmfqEfX9o8DKYkAT9RN+UOU/R
 RWoY8UXtcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBwAKCRAFnS7L/zaE
 w6GID/96qWc6HzdW5LSb/XKz9++1uSGtny1zn/Y2Dov7vn78E1+wi1vBGY97PMuY3wBXAFWHPkg
 je0bVLHjsDEv+4uqAr3C4T0MelEgMHgYx+EcA/vRYlrZsDTah14vhyIVVBAgU+LH/qnqHJ9vnb/
 R07bjiuhq0RygoZggbvZxDp2/psEw1yfOq2Tv+rSH51jenKvSShvBbfDzpmXNvo1WIKFKuxObtb
 y+L/xfFlfq9tSHkwKnLFytYKBRgerLwkqFANPeuHYpPL9EXoqHjKuvAt1CJqc55EJVNzGZFkFIT
 eYid0jiEyP0q2IDoJDYUbTPpGLIDJcrrC3Tc7J9uLALV7BTKVrJjdR1lZD0FA50vtH/UdMmTlKt
 vHba0Q2n68Kl5mkhjCDGHPg02it0MuFVgFFppU2bT+u1rTNlfSu1dZpebdQ4uCu55REXTij9N8i
 v3EWewd2H6lkniqel+JvZlorsNA+W42Lpxj7xHgKVQnd5Q2nvPKVGmneLlRQfVn9fpQ/WBaxBuo
 aCNzM7qDoUqFEYSbjFfwq4Tz2MUfkkPH6kT6ZQyMiw1U8U719a0prDzVkG1x9m3lkx7W4zcsGF8
 /9P/DxDJVq94qbo2A6aa9ouqHJR7NFgwxXkhLUoE7sqoBb2GDX0+VLb4wUCGtORmHX3GC0ps1yv
 kOomrQu/puIrA4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c1727 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: MPVp-9569S45e_k4rzc8oOvlf92OPSYQ
X-Proofpoint-ORIG-GUID: MPVp-9569S45e_k4rzc8oOvlf92OPSYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX5ZdDzOzgBzV2
 p7OOPgRQPV0kV2qbvDGaOlHsuEinU0k0n06FfaiDYdrA+NLbsVnHOVeEUraOzOIUPveK3oplfYa
 HT3Ne57rwf7nSqv9q2glhblas3pamHqD2e7yBNEa2bWaWSZ8aQ7sZbNO8IWbONnCC+nxUaGlnnj
 XAEW4A6P0eNnd9nXuPt0YQNEW+TiqYXSSzN/pRwNqCh6zTe92wAXdCfuFVPg72I1oF8WVnElI5U
 ksYMByS2CPr/lELYh38YCUQz8tuq1/odsDOyoB2RCNxwgD+CJ8+9wkNLNbSirlvKR5wwmnYrEKO
 l4dFPrZMIJqq6niwjAjx/EKu89amAl8k93eXV0aRy4jJJ1V+oN9dhfc+gBSE2F3dG7IK5LLf4tT
 HFl83uipBY5N6jyBlt5H+6Ndpv5jie23f5gwAd6wglk+uhv5bKXpbt4QYtruJiArZP1G5Bni6Dx
 XlLRrat7CdpqbMhqWmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
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
	TAGGED_FROM(0.00)[bounces-17033-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: DB2FA1736CD
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


