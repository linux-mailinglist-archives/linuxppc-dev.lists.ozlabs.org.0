Return-Path: <linuxppc-dev+bounces-15344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86676CFB1E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 22:44:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm4SF11l0z2xQB;
	Wed, 07 Jan 2026 08:44:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767723371;
	cv=none; b=mG/aGl9wbwnT6AK8i4gTFr/Z56cp7yD+sjGba2qrQ0C8EzqaY+ZoXovLETZIfaEEHp5wZUP1Ohxl1+kJUqAQhhQduePcg5346kpoF2ABX4O2BZdT1mxink4gS1sAM5VUxxXiGjHejADxH3vSDqA/Tpl3Js7H3Ehb0udbHZbwqPT5So3xsC0dFZMZztRjXTNdOsJbxlGo27EWL66JOJ4TIDlSnwZ/QKf0bt606Po1Duxi0bcpaEHdqo1Z+gYhpFyetTwUBKgZjlZsuXVZiFtEd5UsDONnYFV/1EZ6qEPA2MWkY9QKHi7g4lTMyb+ISEEwd2+97Y9oo8svXxuZLXE92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767723371; c=relaxed/relaxed;
	bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3a4yjnVlQkrKJGF20xJoMxiqho7xkILeDgDEjTjj81QLK6VzWs+/5FbKE8xN3rqRrz87dR8TPs5dIE1kkSteZWbiP9+UPAtZFTvOn5G+I+sVvz2mcDK14HKv18WOgo1drd/IRjll0GbSL4uqsVZ8N6YefLc+k8c+9gX59Nrb65pR5bbPr3SlGlXdpTd44PZL9pzSmdskYMVtgzj4vuwqpF8Bv3qO9oY6XU4p2B5r7eLG4zrea91gq/JOXZS0dymv5yOTx7OQHnfCMh60qOYyecgLtH1OzP0B1Zk+kPJ4TXWc7kui3qkZAa8f3Q7QQgETfaRxS9Z/eK06qtl7iKY+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jh0WVdvT; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppd8gL/8; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=abel.vesa@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jh0WVdvT;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ppd8gL/8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=abel.vesa@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2494 seconds by postgrey-1.37 at boromir; Wed, 07 Jan 2026 05:16:09 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlzr959SXz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 05:16:08 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GiqGO959394
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 17:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jzSTS8fbRs1wSAGF7WUmIraz
	4oEVJgEJtLyxFPfHdeY=; b=jh0WVdvT/iHJCW9ccrMMRQSXa8S7RznjJF2rwsEN
	YKwyXrzMt1PfUGji8KYBTIfsqkOYc3GpQakVO9XP2+xjmyL6iXyXAFfb71sInSdv
	kWR7WbHq4o4RAv6mIDMxZHsbokci3U62YI6Paaf3X2NngzaBz4EKYYB4U667tyq7
	fn1r6oK0Nid52Eg2ESQNbj+OEW++qF/UfR9bcvHyZIrWkZcaUrFsLyPAiE/LR2Pd
	sydRPjtTZOWB7NNLg+Yzs9VHBMmrEhJ8R9K14MnudQhdrTihKF8rlaiHEKxKmnro
	t1+GLHOBC15gk5klSTnDod8Ij2r5Jn4z9szjZqTb4BWpoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66er4yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 17:34:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d7ac8339so49682031cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720872; x=1768325672; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=Ppd8gL/8BH5ML4Xrt9e8NMjXyA57c+ECaPuhnTr1TcuB8IUIKgdpSc34XSZecKnycY
         qPql+i/rxqwBF66HrP7UrZvZdl+kiulmh3DKi5DHvOHTa/zB8SD4uq/dHWNOrqFWrdlH
         9AQyTSRIhLXM4iMQEXJeP1vQJml9Inb3sMW0nSEEk7BM7KrwtwvH8ZSrblmyjhefw1u9
         JrHCLO+6VRFYcuXwQJH+vCJl+vpJLJNj7JPZBMwsC5CPJDwk3ZIGU2DDmxaEQzuABplo
         3Wo1+bUghLBWLc7CTXAUNvQ2vYEvp5U0Fk48iRS9e7APo/j+44TiAbDW5a2lTrwDtLeb
         kCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720872; x=1768325672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=s8HdR2xpDE4f+FF5WRxS7b7d2M054YJVMK9WhuRA0YTNL296ZzGmFaY+4bYlLMParH
         sw0RWzHxIH1HvmegRBQzU7ZgQBXzMdf8SWH9BnY82xulrWdBjeQOdOiL1OXEnHR/3L9b
         7eYdMTUEVnmj68gDF4r4KFhCknJ/4r8X8pfMaKSE4S28focDT2J6V17e0zcUufw8U8lS
         nDEGF+WSGlfaKZK6kJ6HPPvXaWIWC06k9RmIDaHHhsZl6Jwn4CD0VjjgTLjTyrXj2ku2
         Ihzfi6Rf0rIAVt9e38iLXNjBos7QSCZGT9UngfCyb+a0Gqxu+t3vRC4tJkwEENhpxThH
         qcag==
X-Forwarded-Encrypted: i=1; AJvYcCXJjpV20p/CenN4TvYdCN+ykh10dKM/t3OJPuq3XigBNJn64BI+y6cEto7qQrLty3YXLPpTu1wmARXF4uw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuXvyOCTYxsxZYJWe5Yum3TwovsCuDVwRMingirZJ/UFWrj/aV
	iCBCkd5L+LVbpFZ7MmFFZntTnhFqcaqQ3bqmyuaRW091UPBhQ4xlFXyT5IHTCodpOUUUurnOtkE
	6hATUZj65oJsDKQ+ivJlKAKIUns8R8+l3wEqvfiP+Zk9OV0CCEIKc6vMLFQdBBgL6StVY
X-Gm-Gg: AY/fxX5MpJUdOjzuGvQiQCQLBre+PonO1fe2X/vqPt7B1hsHTzBWiuC9lHRi7Y9by1L
	Jo1W7XTfSSkiIdskEHvHZdjRTdKocJpdA4QLnCHSH1D9FImfk7wDnmJuqMSDAg3CWbf1C4R7urB
	hPl/M/tAIid5vZMqnKKYlWl60yj+YzxOvcFGWeYnZK5GK7ht1nN+AjrhC6mDfDhKopQKVqZimRA
	YiRSAc+9Sg/X7NWgmLN7XFjbpQ1me4acLECDiE+p/0F4jLmc3EIBsr0i00ifzjn535zVv/y2xhp
	860RJ+DigbSk5j72cvUANSGNraSYvsWCOqUbqiaxQLvs15CnJWjkdE3ZTEZjDhEV/lKKVD0PWBV
	L7GQMC/izGZaVK6hO0kLD
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57403131cf.37.1767720872015;
        Tue, 06 Jan 2026 09:34:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsS5Q8M4Ax4uLqCekfjuM/TS7dC5bAY2/2l4KJvBIfjf+72ZUp+kPt+lte2C5fe//DuAlvyA==
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402111cf.37.1767720871283;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm2551707a12.33.2026.01.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:30 -0800 (PST)
Date: Tue, 6 Jan 2026 19:34:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each
 OF child loop
Message-ID: <pbmxwpyohpq3pi552pjwwgfe5wcj7qq7fx6lofpod5mq4bvmwj@sn4yfn74sgiz>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX7iMx6IhOEMDa
 d391uJL6n65e4yw+x7IT/outAtp7PGDVAmdNsVOgC1NNdEmeRrJ1V4VR4r9B11CgEo2MNt8bQqj
 LpzwrGBRrZmtPK9v95EMMuZ7htx9e41JPvUfMsTOSkngrLaB1yW0A1WImzYgmGJWpXDRfTXUzL6
 YmpdbatM3qpbTEQDhuP2cjNDyn1IH+9nCcgblO929s6OqVE1Zk5we+Mqt1SFvVd3O409+AsVEGF
 A6m7woKvF9CoaUvrs+q+IeX4sGUP5p4hyzweQwiagQgfJAVseJ8DF1brwQazfRo1lKkps1FnEPD
 r4vG4w5amWJDrKUoJ4Qi+d2DmwFF/ieiTYh8oPVCs02/0pGanVQEcbT4eIs7TBpDv1yB1+oKH/o
 PCP4sYy7+JOUqhXgj5Te/DMe1y8C63GalLfQbrenuDq6vU3JyexHTTWu0/NAc8qMUOx2q34EvSQ
 GIk4qB38fvUe/vi6JEQ==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d47a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: bACDByBM7NlFFdm33jn0YnfB7Qs-TAhh
X-Proofpoint-GUID: bACDByBM7NlFFdm33jn0YnfB7Qs-TAhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26-01-06 10:15:17, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

