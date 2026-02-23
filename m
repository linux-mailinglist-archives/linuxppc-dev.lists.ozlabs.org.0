Return-Path: <linuxppc-dev+bounces-17058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG/oIW1YnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D67AB1770CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMPB6J10z3cHx;
	Tue, 24 Feb 2026 00:38:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853886;
	cv=none; b=EDV27bWppG3CnG7thmtjR24JKHDyM4ggqAn0hhLlnaJQoY87W/HC87VJK9tvVQZwZsSl0WSIg0QC2hf3Ts+EZSZMgfwJf76G6QXY7KRNl/OuKSF8QHgR2+tASKmGPsxuE9HwliqPMHReG4pdUSVPH4rK0q1Hcg0PUWRQzBDwvX2uoepBRzwHLCRcLckry1mXIxAkhX4MjStmQghSy/8AIVKDZT10z+8apCaS7K6wD1UCVnqgeHGWDdRflMU3dqdiq8ffLFaZ3u2xbphmvaxcXbFMC3ZpIr2ft7r/Op3dyYG5+pFRDxzYAR+iEgt0zgyc4fvUshiUV/9sV+DJO1qW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853886; c=relaxed/relaxed;
	bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl8oBK0y5R/SZDOh3nW18JAqMxTUK2MntNz0Gh5DIApdlpneY2aspsS/SaLMonAJxbEQCVRizNF3eHD3DZW4+TnH6ouy0pbRhBaqp4cz5/l/B3gZdXgJqioxjhHCeuEuDHRVvORJvi4I4tSyLV3ylX1uPzqHh3BrUSTYw2IGhmz3E2yhaFR4/oPecmRLzQs2VB5l5GphHBxZY+NyKqrNvSmI5QuMSHyi0NKDDx7/lkZlvGbhy3iqmUoz7t8tNVAgqm1ELpe7UgUgG7q7DFkaf3dxok8icla4QcOH7KBJm3vk6fN9RNnd12e38aeIP/t8/eXP+uhSSWZh6EIt7LrLtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PlxMz/CR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zyduw1VE; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PlxMz/CR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zyduw1VE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMPB0QQGz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:38:05 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcvF322188
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=; b=PlxMz/CRZi+cXbvz
	hmTnU9cezQpHsZ1BcWGZMSnsX9VVcbOyrAG2y3dXhwwbBUa4A3KqDiJWrSkNkuGl
	QKS/K/sHo7ZDjrP0Li77lnLvmPDrTPRP7rrYWxExqDwNrP35wWqRc8HK6AHXtnFx
	tModpZVK3yjPTfFfurVauIwIA1IPDzK90YsqjlHQd+c/IuVttP55nql3MIYaj+40
	5vmzmgQ8yCa8+ZQOLL0Bat+ytPGOayi5kJB1bp+5vyEf7ECaU5tzNMBnOpmbDnhh
	zM77SAHIBjufLAIZ8iI99y4vki0r1Nz7lONXStJsAruaQZh6ixYlXe+SFASGpw5I
	0sXFpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:38:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso610787785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853883; x=1772458683; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=Zyduw1VEvZ0L/1qvTaAXt6oBtzwxir8dcG4s0TXnY904xmC3vMaIKIK8mTRD60ACLA
         sXM0dVuD65EWvGRRs86oFC+HVM5iRc4XSo3qLI8jsodGAl9OLfhCqVpuWIFqEeCo400a
         WxXM42DIyfDSoXe0P434CmskvLhoF7hzZoITIeQsxhx5tQI61jVDvJQrLVT5e9zDTOP2
         jvPPQlUpF0gNbYG3L/je59AobVzaw7xALHxwn6SBQcoXGiE/7aWYYyekWJB50dRQcxh6
         0Za9Y3DER7/DvEY2Z6T21/sKO+Ph5Ed6jccldf5zT2z1ZUrKJLBL+2pN8cT6vMz2X8dI
         dehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853883; x=1772458683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=ULH9Sj0etBFTZIsybOH2ZWWaGGCRKybNFM+0Alac1lwiICTIa+TGQISOI/8j/iqWXm
         /XaYkaJK+p1d1zy+mifocTLJZ5ji99s6Sw5JdxqX7fsm4oD/hTC0mwvO/pgSEfHHsUNf
         ilN5d1OF9SukeVZiqnCsUG0F3N2kO3NbpFNQR8vvn+EkxpBKQCFLllEPIpHoaMPmHx0E
         aW4ykiWTpxV7itT9neMnZF4n++UmX+38OFMzhYMHdbST6qa8Phpwjk5rywmZMhCIRcIe
         T7MbM2QgGbbRK3oUce+ai2fC9oWQJoIQiiXN3GNtnKfg36JE+o09ISrIr2M0yjcPohK2
         /yEA==
X-Forwarded-Encrypted: i=1; AJvYcCUVDQaEMUTp31KZepGMU3Fkodt8ASlyS461JOMDaVqSlBAT9QSiDFC3RzORx4kOhfOMiGl9ggXM2aVakf8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyc802M9brpZ+SOHRoKKXRkK1KjKKZkoslnWEErLDrHGeRJjaOy
	3iSe12MP7o6kcC0gKkigfBAEbSbSQgTE2CG1nI9sdFzi7fWS88FeUBnAgm2SRuDVDLpIkHPNeyl
	KbejUWvLkHfyg4iE/2yk82AXP26icRumHz+t0I+2QV+ghJWoKpJu55HmDEcLDjzoh15IJ
X-Gm-Gg: AZuq6aKBOU3lybk9eEUs7KZxNcVcsHwLnQ7YekzoVzG/ZLXNbbQdfy2VxK7DnjP+Q4Q
	To7TymBeHBL11GGl6bJMzcgk3uOx04DJBlbQkTAY7viqVS2C6aWzO3Z4BHCFiY1jBvYd6Hdd5pn
	e8eqvl0AtVi8Y3Xvy6b+Nah8DMGkel8G6a8xS7G7sXCLkLfUuGFdGKpoKZKzXVcJl6ofyMHKjf4
	8nq0xZWNGvGHK0Wfu+Lv0rZUU9t+Gsvwt5Vs7crzCVoNQtxnHUCqEaWh9OwNQTc0pz/V4rH6lBT
	ni20grwaGj/JyPzYou2tJfjYp2WnPD+gLunrSloUEGmWNaPM992SNVEC7Ad/uMnO7RTa8Oe0Yej
	QgYimtc0cGPY6n6K7B064pZLLMnFHlqErlstvh+3JOaUKcnt33xU=
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971548785a.61.1771853883008;
        Mon, 23 Feb 2026 05:38:03 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971544385a.61.1771853882505;
        Mon, 23 Feb 2026 05:38:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:24 +0100
Subject: [PATCH v2 9/9] soc: sunxi: mbus: don't access of_root directly
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
Message-Id: <20260223-soc-of-root-v2-9-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1c1gquLfvSJ+JW0V9LV0gRBtqRjxxuGL6ryTeiQhipc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgircAU+0jsrAZZ/Aj6LcHzqbHGAS/DFEYZi
 t34Eup2YjSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIgAKCRAFnS7L/zaE
 wxcPD/47w3hJqf6FKWPzlvr9S86ReIdYy2gUPFLRaYv1Orw7Hx4Mu5VCL3/KMAaPpiCzFahyo9Y
 S0OUQIgsb1kqb7HIj2+UxTES2J22WsLFYkRYulcQij6J/QljIy0cbcn0uAydjmdb6VuQOawjh10
 FnYXW4+Ib3q6Ce98AoC/U1sqR36/lA78aqRwfswkLIVIhwgq9ERvUXZ0F/h2y/8wkYrbfKG+WCN
 4VlGIAm20rPkLeDtPLAqp1Dcy68aNnI1OLqZ/KsYm9FnrOLtaNxduEseaaxwc8bhbyTtfmjYATL
 EoHz8ee2gD6S7XCtTw3SnuW4Ky64+giBafa0XfNBpPxKAawFQCKd8XByhDvXVlwRdQikXetq0ZA
 k1u8bp6vufJQXZLgmKBXQ6Y3zfD/vgMD5ptFcZr2yn1frat/EBwcg/JBtnoLQPB32Qbk3PmdGhA
 lNFBV7VYN/yATKm2UOsdZH6vEHm2PpcEsINOBkjcwQRrElzKw78vx2mCVTVyBZW8bTWsjBI7ezk
 7WQr8RJ7fsrPuYLcICCUuDTD3QnT4F+TLDnvFX5AAnnPuPJKX/o7ctAdnVJrTMS+wXIkI6pmqdx
 oNi1zzx0nOQy0/iZYV7/+R8P9uqzqXpWIofRAhYkeXQi3fatpIXd82aahNqjbXS4yNa4bMXD7br
 keRpg4pplWqyjpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX52epvHxJB2k5
 NuxDuCu66O6+SlNBkA8x+M2/NJWpE2r7ikcgUo9r8HDv+5LX4idOvhoVfV5zexRngEFLO+VIPbY
 ba2B7S/BeRp42BmYHMAAxuDt4AbJSszjyaAuHJuZR4nJb188X7Ffq9B8DvzdmuezSKlEm8qwKGc
 fLuj7iRcd3WXvKbEHkvNeEUupYJ33kuWpuU9Amd+ZWBLCnhgiSloPC/OOVlAg6cSj6Vujw1/DFh
 egwH8uWuz7ghO1Avag96Ek+fzGK7Afm0a62FksCysquWlUDp7pZePFFIIBQGbIaBMJihjLRaJX2
 lxY2joZ54i9/R5q0yZXXaKuKD/JAHA9wb2iM2KzDXlUlKSpUMnY2p38Io4iFItzEJQZHhKp25Am
 Vv0ojKvhiD7A9TDAxrYQTx5suROjZapJd7WwsQs2qVrEcp7RniX9pUtbXTLcHOQbzQmMzg78dGK
 d/vG9heC+oJNYbedV/Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c583b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: D1s_iOnqbsycB721x8e0PqQRfAmIhY4w
X-Proofpoint-ORIG-GUID: D1s_iOnqbsycB721x8e0PqQRfAmIhY4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
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
	TAGGED_FROM(0.00)[bounces-17058-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D67AB1770CD
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb84b60d1872b31c27 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __initconst = {
 
 static int __init sunxi_mbus_init(void)
 {
-	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+	if (!of_machine_compatible_match(sunxi_mbus_platforms))
 		return 0;
 
 	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);

-- 
2.47.3


