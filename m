Return-Path: <linuxppc-dev+bounces-17026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OG6EEEXnGkq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA117363E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDT5wdCz3cBd;
	Mon, 23 Feb 2026 20:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837209;
	cv=none; b=dPYiCQl3sgrUTRZFkEhX4D2gygun9wBUB8zs91Eng5jw3uxAf8l8gh4nY81svxk579E7S7WAMDRdcPh3tN7gJhKY8hS7TmrtoW+be0sAdNGG4k/xSSsWOzL60nbfwa3CclYEMJZQ+1SpD9xLM8+xBM2phSsWqnk2kMkxv21OLWM1dB3Wl92wzPHYfs1DB6Dxu09iG16ouUmucgIVLMmKh5jenwOWT34X1rKeUdlaEBGF4+2uhOkDHHar/Hp73cLRN26OwtdVoKqHLOPpfR0HMTJkLNvWNEYMke3mVlccO1Xdk2mR8dQvCxLS5vCD8CO1DeXCcLR11umhcrS4TPdTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837209; c=relaxed/relaxed;
	bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/q2kG8BLG+YAXT1gr40A8QEUcsTXRookz0W2XqQasaQIqT6IECptsx8ZJVYtqXDQBjt01n9wQI/1K0GeIKtuzYVGxOh6b854VJ7fruR///fybhcCALcRzpyeFldDoCwTQwsAASfwbYVT9fWchgwxiREZ2D/LzCgzgXFRSVefJwJPraCm9ou2YLF3hg0em+D81xNr2+SlwdTxt6KX1OBWakCO+RgFlboKEHKYi91AM2lRDmNuEyeFNLcJpWgngvyDumF4FJME+mby9CKU6U5M0eWFKT630KvesO9NCAf5nSEIiF7nD2fe2YsSFVS5izE2L3F+tQVgHXzEx/4dcNcFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L2TcI7/x; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aDQAoWgX; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L2TcI7/x;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aDQAoWgX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDT0R4Nz3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:08 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrhR91824711
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=L2TcI7/x7teBpyyJ
	gPnAHuqTiwFcvqBpha0hG6k1wOXoQPhpicQsdZSIGKwqLKU4eFTnGPsjFpELk286
	EMx0GlV3ROgtwgZG4p1gJNZq5lr8WTAlBMAroSDT7/76+guIkxKoAgl+FOfivX5J
	KoWiScUAGlncq91zMMk+YdyxSPxUW6KQwXxu1LF8VutmGL/LqlyeDvVa6bAMdiSq
	r9rJSfMN0tA450ClmXMDVR9dmRl1bKnmVf746W5BYLhtSLdVkqYC7hA8SIHVT1UJ
	aNg20iPugZxTE/mIJisvw6Wknmu4wgJeieMIG3Kqx4obZXeJ7698yNh63QWjDO3Y
	hVc8nw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc1vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f8dd00beso504097316d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837206; x=1772442006; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=aDQAoWgXwLiJH9ER8EIkMl55w7jDeSLP6/SjvrKbMwtOVKDpox1jGNPdRrnZHVMYcs
         +3wp9exXF2OJyrx3LgNMwp2l9ez+ZYX+O71IYZeUwjQRVE7bnMEmn7X6PFOpW2yF63sW
         uGw7hngnK4IuGZDKQuHwZJiFvULt/OiBOlXjH74EMhmu3qIuUL3sz4TjGUs1+yrf3ywP
         foaUhLddE5BXxAkO7Obye2w6D0fzKQDilnOrucztE3bjxD/+6FY6jCLdITUcZz38SsmI
         kwn4ZgbtELjcrMi5medek7785QAiwY1ZAehC0ak3CRCmZFtXRsi3gp4Lr9gR9VfshIt6
         mJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837206; x=1772442006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=e+IM2tez3PfR+SdUK5i8Dlu6oaLLmprAugWIF7ZbEBQmFc2ttRW4TRvRUmakCTHH0K
         r6tCMyYgRPuJH6wqJeSOBNdg2PVGGK5kni795PGbzyHEyG0Y+nOAUwHNPudYEMptt/zC
         ysa+b6yg7LHRt0xna7oG7nWrQdR9lxwfL1NJPmpvT9PXi4Os/ydDJp1b3s5S0qq7A2Ai
         ya+JvXnoS3jwDIK77CpBBvxmZkVtKmTFoUJknfyIP0jaiAYEQygQBUMC0zHzrIC2w/a4
         sKqYGQfxNE+OSPc2x8uzITvabMWIiY4yrZ4un0HIBktXk7oo9aRHd96XOEpdDvGCyqu6
         IkgA==
X-Forwarded-Encrypted: i=1; AJvYcCUcZTm7ucx+giG8eY2PtGmKqvqB+cUdphFnLuCk8tRfGfOQwAFmI/DXaYDJYVphm6IHx1yOryTZwjs4zIc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFDd4Uvh3EsOUqzDgxfuXWCwJpZCl6mbPM2S4xR2j8YDB004QB
	PojoLD5zfq7yrScTM8GOqmOsRLRXY74Gg8cMFKrP57KgGoHFg7uZelpSOwpY8uJSrR659JlcAGl
	11oQaLHtIcMsQwOIr9Wn/22dBB8x+NDpsthTy0CLLCBLeJY6es/ods3SXrWdvti4JiGUB3VPt2v
	15
X-Gm-Gg: AZuq6aKzzYC7ykhCfGJWabklpf8KZ7JUVZf/RK+5Q5Wc/2ClMhI7Qn/ViEx63pJgqRl
	mRWd7BLPCGpRNBeG9BwhFNvfHKFec2devdXx8ZnI1sUjdpWigFtJ17cMzoyrNLhXRJkMR9zXJLn
	iYhfh+FpBDq2oofiHzzBWo5Sdr8jRX/YtkHo1NupTrpN1ceIMTcNUvI3bHS6BYkdXPJMczg/g7S
	htIz9qMeiZuBLSX8O2YkCuOrSu9qA5H/sIS1qJAf2kXVFNjKHzk1tXy/wCXES3QXtEmmKfsiNDn
	Tz1mgwPcKAdNUbwxItPomRgaBc1pF+c42awT2bSgMSwy9tHZLB6uND2kDWDP02T0/qLrFzAI3Fq
	2t/cRUM96J5Dj0zOFXpTtlSQFxMR5S5i0Sig2Pq/HUPChORRmwQdq
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029848385a.26.1771837205842;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029845185a.26.1771837205401;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:34 +0100
Subject: [PATCH v2 05/13] i2c: isch: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-5-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcBJgBWfoyEfYLkAxhcJWdiklbYSi9bXzFb9
 oLJUErBEW+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAQAKCRAFnS7L/zaE
 w1P+D/44ZcebR/fvD0BMZJTYIEGXsUdU+RvW7Aguaz+mVFiT8m8BjgGaH6bXTtOwFXWltPaYVB8
 gA988LhNnl9RLXQx/d3msmtcpEzxnqJ82g2IBUBx47/Qn5JYYgqUJ7LF0q0dHMl1XKj+e0awcp5
 VRPl4BH/moANOs+eghmvoD1ttdkl+3FMIHqsbY7Kq88iSRMbo7tml0+H/KbtJT5ypVwq1TxHAOJ
 1hCKo2zPjVoDM3VG8yzn4TInTSrlxiVog3/YIPtDR4whybvkrctIa0AX/Zyjn2mnyeI8JgqAXSR
 oaha7BeM6SAMI53TP+V/jq4Kw4RO0v4sVIlKWDEcbXwzmDjH1HFntiZn39C1ZqAYSIflxBKNV+Q
 CoFSfuA2hIq9W/iYmZ3ejMyDByyLKraBPgtOQ0sUPAsmNAIHLbyL//uxD/mT3bvqkSgUmhF3Xdi
 Shm2mBaRB84VPI5P2d5OyK0nbkN6um4VWfA8q/98mjk5X6c+AAmrildSJD0c9WP0L1WYkV7eTTt
 vVWBUJA8GEuLnQPcLTZg7kSKixPQArRRLn9sv0l7sLSzNUqTdqML+VFuqIpRKlbCilNSbTzt7U3
 kLL6biV8HF2aK+DfRl1pVWcaj7QjPt2rrNc2DV2Qt9ocvFAAM0khP2QOYQ27/rcUh4kxU8j2Zzq
 VHZR8pXt3HsZDeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: h0lLitPnNq3E9auHovJyfip0Z-zq_Vwa
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1717 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: h0lLitPnNq3E9auHovJyfip0Z-zq_Vwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX2IARYJym+GVY
 Ef+N8ao56vCc9V1lomYVVQ+W6ZyfDzwfJ2pddT0ztIiwTIiihYpzc77Hs8OBVJISHcEoMchbrJ+
 MJOpabfnoCMAWLM60R+oHpFhwilfWTtgHiJJMMcAwDfUKTUS1qGO1oKSqxUD1jzNZS+FyWeDHPN
 /5OULhm78wvvMhGbnEb67VF3lI0jdR1Zz5/CpeCsDeVKKAwC0W/4RSAhN/J8q9Lsnlfi4n4zwGZ
 AHnWOWw62rw47CxxbiydgotBxW4WtzKIJbhSPDnHXrDuq25O3n6jIemXPUOGF3K/y5EXX35Yz9P
 JG1m1UusJ9TT9zWeMUMybUEmdE1InkFWgKc7LYyzIKvKve15rN4WMpFzFN/YqbkSEd7Hwal2wMW
 e34gg/xmU35HfrKNM9Nw5hwPAuEJlviiKEFrAHEnG2twTHd3IozYEFvQ4kNtmcyd4/U0Rmu7ypB
 P+dQAdotceydu2q2McA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-17026-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 8DBA117363E
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-isch.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index a2ac992f9cb0d2accfaa979b802b98c3b7fbe3af..6ff07ab12e30db6821cadea4de3a588b9023ea20 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -86,7 +86,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 	int temp;
 	int rc;
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
@@ -97,13 +97,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
-			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+			i2c_dbg(adap, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
-			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
+			i2c_dbg(adap, "SMBus error (%02x). Resetting...\n", temp);
 		sch_io_wr8(priv, SMBHSTSTS, temp);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
+			i2c_err(adap, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -116,28 +116,28 @@ static int sch_transaction(struct i2c_adapter *adap)
 	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
 	if (rc) {
-		dev_err(&adap->dev, "SMBus Timeout!\n");
+		i2c_err(adap, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
 		rc = -EIO;
-		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
+		i2c_dbg(adap, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		rc = -EIO;
-		dev_err(&adap->dev, "Error: no response!\n");
+		i2c_err(adap, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&adap->dev, "Post complete!\n");
+		i2c_dbg(adap, "Post complete!\n");
 		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		rc = -ENXIO;
-		dev_dbg(&adap->dev, "No such address.\n");
+		i2c_dbg(adap, "No such address.\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+	i2c_dbg(adap, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
@@ -166,7 +166,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
+		i2c_dbg(adap, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = sch_io_rd16(priv, SMBHSTCLK);
@@ -177,11 +177,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
+		i2c_notice(adap, "Clock divider uninitialized. Setting defaults\n");
 		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
+	i2c_dbg(adap, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
@@ -223,10 +223,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		size = SCH_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	i2c_dbg(adap, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);

-- 
2.47.3


