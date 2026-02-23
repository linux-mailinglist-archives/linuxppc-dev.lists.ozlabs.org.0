Return-Path: <linuxppc-dev+bounces-17051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKGDJzpYnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F2177040
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMNt3hDdz3bsC;
	Tue, 24 Feb 2026 00:37:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853870;
	cv=none; b=f2HvTM3unkgjtSSrCeBDXf9ClNI0Ub+xEybssLftJNYcUy5NV+ubGmSvuq4TaRAjBaIyIrEJDaZDpIQ8VeI/Z1l+4xusDJuZGd3nxaGIT2bsZG2diqrTgLw6jYolTTywy7hUrXc0p5J03UdFOSSUlGJDc8NRRjoJApzvBmIsGIannfLFWvzWeVT1AgmVrwbNBhf/g+K0cCUu/qqW48kAfDQXl8jxbFjcGkeyGOL434d0W9UcEFY+V5rCojyXV+VWcwP0Se2OPGmsoZ52ciiN7XL82KChfzqGlr7RuhT35Wkp/Y5bgtSPtjm8/SwyyJxpX5tHF+wPmc4sO6d2ahHjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853870; c=relaxed/relaxed;
	bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4CaBzn8C5jSOZhLSVk538dY3/4pYhrIzP3HhscT5YU0pwjfkX/6XPdXKTP9C0XSX7Ag1/BZAo7JiParDp82B8qzLGE6U8HIjDcWwJDmoe0pf+6VXM5CAkg2ywNYVOCzh7X8Oer+9Y5xwnGHCe0e9dsrTacDAYOQ2J4S4BhhkP6vBg8Ai3l7WTeTixOsE5schNT3NlqFdgEfuZkH4xwLEVg/r0pYAVfG0/RrerkbqS2JV7MQkAvZOUZpa1s/wNI0/kiqvHKGck9HPREe1TdRaRV8EvBwmEHdwEuh57cBb7Ls2H4uPxc01vbrivFv4TZ7I3iFMPT/ljouSnQH0+cZfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gc1bpG03; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpDdRvx9; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gc1bpG03;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpDdRvx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMNs5Gp8z3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:37:49 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcvB322188
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=; b=Gc1bpG03f022UNad
	fUDzodaBYofNggGgA5AoUsJO8Cae+F2eoClsfjq8mxraTNEdYl46C2C6dPC6b3oc
	IzwMC1C/OASIq180M2ajZXcnIp4sTKme4BS+j46IJ08VbJse3a12CtSUcWOw3xWm
	IMALeVJl0dsGdUKPb9T5wdbgPl4ypkerwEVfgE7Gr5Aq4oS/Ws2gXQrb1ipfaPwk
	659QB1Sbq5CYS+qe6ZvsFhsoixSsy5+yMNbsWQg89wpUSgTI9fgOpFd0TPe/Cyew
	oYwByt+dZsthF1xqJsVtY4bAXA1gsXI7ionPuAHjcZJZxSjqyMWzYaao6/nX17je
	WouRQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso610756185a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853867; x=1772458667; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=KpDdRvx9MP8g3KYgbBbgHu9CM5SAKOgtVg/uj9sN62tYO46qOyZYC6LEucc04JGggH
         6VdHrzqLKEOngo/4LeqpL/RZRhK+SLMdiRQobOCiUjKsnoLkMQD2cLLQfpYOTHTl84p0
         YLxh5pr4bgp+ExykvGNA3xDG8grYTqrKFd3CoR3rBVP1Q18jWF4rD+EIaLWva8nyqByP
         WBNu2zXYNAcARwjeHTvq6+6n5dJjWGYO7574QKRy/vCV+nCddQ3JdpBr3eLJF8PvwNd3
         cj2yw1jGvUMLPT/g7qohjVdR4iCUoq8281RjS9Fb1Uf2FpRExtRBLh6cP8EUZ1bi9pjZ
         77Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853867; x=1772458667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=tQ22RX7cMGSvjxPN+rIJ4MHTyRG3OaqSEcRX0Ei8c1GbIo9ZGT1nW671sVIH6ucy79
         u+b9OpF4QAI7gwBYUGiDSW5CpSYHy4zOQINkjaVez4QP9Apg/LyG10QB6PeoPjYiXofg
         F2t/HzL5GXvd/OmgDe2yIV6pXoDQ4psDj1D6LIZGJifUYMHhL7DSk8+pyHFrvdeEA2h6
         WVnFKGHXkfwVj7n9aJNTL/AzWUyxW41agtmHryOtNw49J5jMEeYTKPlmDRUg2CZk2Huz
         SZYDBZHa3kZ8QUaWhXKy2yu4fM4hRkKCLOqVNgX2CfxdNgzWp1Zogwgb2ce9W5/xR4uk
         x1vA==
X-Forwarded-Encrypted: i=1; AJvYcCXDucnYaep6FVfutNhmJFwRMv2U7210RZL5LCWIrVhRJwVNvSwLytLmfAMSb/8SyW1FPY5Q9PkyJzv52C0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuzJDKPT6hDsLxGjEePZgSs8qnqJyMaySiRc/WcjK/BeOcH5V3
	FKmGsosZjhQzU11we6XlclM3WVyjb0HUrs4jx+Ii7Rl8faccf8GGD48FWmlgT7j4uApm1E88ibA
	EIow/qs/yLn4HUQn+gp5zi3cCVVoWlf93NGv1yckC7qaWAkkJLn4VVczJhax665EXPFPB
X-Gm-Gg: AZuq6aKAjNO9892g5cj6LOQYGqiASuqnIPEOqQi4cZCMLrJudviMNy4hXwp0jzS1Dow
	iwp01snj1NKSXLGTjpscJjuymC25TPvhBGjRr8I/iB1clLWvvJzLiXDqs36WgcotTaWclirp/6l
	YRDlyfepneCayfem2HkMWzdxrXPZm9ctizUvIab4pfxifT+HC5gwvVri2MU+EIMHlTUMuSER2Xg
	DrufbKTMnZDhzF3Uj6p8rLbGiRqGRTPv0iszASKCCcXNmF827ETjF4tINMIX8er0jUOGSfa66sW
	Q/Tmrs2XbYCw0Jvh6oJLJX+OpbSFwKyuo8K1fFky3ujonL6hg/My1JT3YaAJVvDARnfvguX/2Xc
	nS/Pz5HpoXYR3sKyxyLZMzzEiwUxxC/NFTxZLp6Mm5uRzLohsIPw=
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959711185a.64.1771853866880;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959704885a.64.1771853866254;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:17 +0100
Subject: [PATCH v2 2/9] of: provide of_machine_read_model()
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
Message-Id: <20260223-soc-of-root-v2-2-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/FJTjprAWyIQ0p28j68CoxC5wxhBmOvR55ovCeBCxn0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgbTl/b6yX8U2qdfd5c/S2H7znWwXym2k+pZ
 MO32cjbGJ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGwAKCRAFnS7L/zaE
 wxZGD/4jPIFbh12WXp7rntI8dFBgq7M6R5+xsXiKYS1w9RXHJTI892M+j1L7beIpUNcpYkqP3nv
 vmRLcAyEMG09INav/3Z6yLcTOENIe+OvXqQJ1guGaOmEPg+isS4JYzMckXNBL0+QdiReYpyNXE1
 rkxJ4wyEXgoGenzNem/5lqGcgvHxFmhXT2ilVostK2JOmk/NlZ2D2x+uk9csiTfV3YObr95sX1b
 GveR3OzPuKuYvA1E6s9icHhS7nEq9xKXBcI2B9L5qwtsu8OXLpM3JsNUNx4vfNR4n6IBd8d8kta
 SJ+l6SUSwWxM+MGuC2wSB+a5GcycljvcmLKjRphj7duZDne6er392axMkRJGhTxahwQ7pyvnZwl
 Uo3xOLG0wfzLtLUhoWo3ehlZ0bbxzkhaJ/G170mFfWSQ4F+tasn6CVTXNqfmZiRvDeMWVAQFH3T
 48Zlp/AsnbU/0/ktaFdf/sgbYpdBpKWM5I/OLg1qYAHdEeRgzPJGUTtnK8C6LbR/nQgXJq6yjgm
 OW3xwuOaG39ZjEXVUtNiInBsxOZFETmmWfaSYMALTPYrsLYrP9vEnRQLvhDEtTeJ3uoBxJjqQe2
 UHrm/TILadf+0Gd9sfzdKQQAMUCkOcG9oP40wWr1pfsRZrE+OdG5s6iGTI6gMNbEKDFcJNWst0R
 NJIpI4bRnU3W5Ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX4UQ1uPthHY6W
 lGXNlvQRkB4vXoamczrxtSGjWwY9lG1wJOUz5RwzlwlKfk2v4iq5B14k3+VLNrCqfSwLsni8GSJ
 2bhPukko+4hS3JwYBkbgrf/lEqHPUyhrLI0q3DER7ZSzczNtDB2bNss2rEemeiO59dsXRlUD8Hz
 v6z6wRvkoEFjnaqfy1gFJRLNUdHZkrejT6q7OyU3q4vyTx+vEDguRBugQD5SIDlu9NC8ouRgLUH
 4cF6HVS9ImsyjO0CnDKOXfI/kMxpJvItnb85RqU0lzgKzsP2xCkrP3EgguVt8LIPGGUzlKwaCFe
 /F/5RtV1DSmDwh10kywh7zYdXDuBVqzwD9Zim0/nO4mFP8F/uz+AgW8gQTVf/317V9dfeWMNKYN
 z7aM3ASIR2yfgYiUkVf45Ls1uCZwCOEeK5tpxwkKF62CI3Sm1AfdAXrnZsO0u2LCP1fzBVcJhMl
 P1qYc6E7aGNv1zZ49IA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c582b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=F_zDPpySZ_qbLQh0X2kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: q0mX8uRIWDOee4NLotXA04VDzFp9_RZ_
X-Proofpoint-ORIG-GUID: q0mX8uRIWDOee4NLotXA04VDzFp9_RZ_
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
	TAGGED_FROM(0.00)[bounces-17051-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: B18F2177040
X-Rspamd-Action: no action

Provide a helper function allowing users to read the model string of the
machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b70aec32e0e35ee232b413e548742491bf763df7..bf4a51887d7422f5b8bfc63c7b20674bf03d800e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -449,6 +449,19 @@ int of_machine_read_compatible(const char **compatible, unsigned int index)
 }
 EXPORT_SYMBOL_GPL(of_machine_read_compatible);
 
+/**
+ * of_machine_read_model - Get the model string of this machine
+ * @model: address at which the address of the model string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_model(const char **model)
+{
+	return of_property_read_string(of_root, "model", model);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_model);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 7df971d52b556f21b510a8b5ebfc8df49a2a6f64..2b95777f16f6ea1fb1e4bd0d9902cc2640d14795 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -427,6 +427,7 @@ static inline bool of_machine_is_compatible(const char *compat)
 }
 
 int of_machine_read_compatible(const char **compatible, unsigned int index);
+int of_machine_read_model(const char **model);
 
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
@@ -859,6 +860,11 @@ static inline int of_machine_read_compatible(const char **compatible,
 	return -ENOSYS;
 }
 
+static inline int of_machine_read_model(const char **model)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3


