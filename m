Return-Path: <linuxppc-dev+bounces-15343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1FCFB1DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 22:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm4Rc5Yflz2xPB;
	Wed, 07 Jan 2026 08:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767720718;
	cv=none; b=oHmY7er+kP9TET5bY2c8Ef8SLzvJzOO51s9RKt+Q8n+O9VTvNPcedoNM+I3ZRGBcfq+FQwmHIPM3+EEwq1XlGOyQsobSIy9Qr00fqfDum2PAEvheZnY485WMoioxqmWC3Qhs6CBFP4zbgyZ4h8FdjcbZBO3xxUvwx1FuT+/eprsW78dhr2MMsH5SGaKAG9FZCGhH9QxnhUzobUDrh9EbdvJIWfYR8wO10kMQtJBkXFgJXdu+NNB5FxPfxwb8DElV3hLgebnmGmkhPoZBv5q3VpHK4gb9N7XiXvLodSxe34Wqd1xtu8JfFnS/ZY0SwF8Ge/eoDck/U4DyNfPS6n8Paw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767720718; c=relaxed/relaxed;
	bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/XWj9lNqvepO2S94+e9dY7hw5rcdridtJLZ5oQcmA14CJAncHgfd506vj6NKvhNqA5uAHT05Orz3QIASMNo+wpj8/1FWNFSeGnX4yceSzZXbgje0a/XRtDAgLwwQe/9kw5sxFeoukDz2u9hMO6Qzr1eRtB1OWsJPIXIyv82qs8jDnXCjfaaqlXbo4MpusXauy5VxO9ifguwqDuWRoGAvOQS+AotozEKEv/aN7hbOud5iGga0YeuO+YanhsvTnZ7Qd8sXVIxXjCF7mcWHc3gg47KVX8h99kplegxhDaKTd338IXiLsRK7YOteyv5vJZnkbeYeLqhk7d61y1fLmSgrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7Tf7qlm; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0deqy0L; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=abel.vesa@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7Tf7qlm;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0deqy0L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=abel.vesa@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlys94M8Bz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 04:31:56 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GihZj4136988
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tR7f3o3xDPesUQHU2saQhPf2
	QeydtE64EkpRoTZj7tk=; b=g7Tf7qlmPp+umH1OgIEt2FQrpO5qwZlUUNF3FQZl
	HX1biqamPP+S3QFifEQzy9jaf2AY6vUJoF35oiXAOiRcf7HT/JpD4/pZg72K+t3C
	meDtBuSkuPUtpQRnlMI+BCeSgCLoRWGj5N8RRhOo6SsvbQAXRKQ5aOtEhqcE4YPR
	ygNhShsgBjdp+RDjAGGEWH+YOvuR9jhO2qYJ+ElfM8hMEzKhE2ZNzViBqTb49Tjw
	g8keG8le3o/HfvDI8obGawr+Rnl4TKuHIH1Kg8+DmX3jYJUlfvHZ3VLXqFo4lL1H
	x1kiM89xYc8xh3TUYxYELjFWUpGO4KxiTuAZ++/yYVIrPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e04j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 17:31:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4fc0d0646f9so47913151cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720709; x=1768325509; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=A0deqy0LiSW9b3XqXD+s5+Ryp5OmzLx/9BlNCHLaquEDDfZ+6LTA7W2+XPV4FdvqWg
         ZgQJyzxBUzpXwhTqIH33xTFJ5bpBZW+FzMedV2ZL2oAznK/9LI4YYg5bhi3THYSDR6Lp
         yYE47q0S/Dq6bNxy7p5xx3RET53zJI5r1CxI+wxrJ9xkiodfsW7DyMXl8KbfyCPbqMYB
         ZV1Q/rtvjA76bXe6r/J5NL5f17QMGr0FKs8JZZroQeyYXsoBuEzIbLVTCxYbZQYbgtFa
         DSo0mNM2pIBb5TgiZErxZ3oMIJS228I5YAOSl7K3F7iYZRoIy+YaPUoWm7Tts7jdyhnV
         utHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720709; x=1768325509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=QDeyuUDwNP6hMV//JJVOpqlfh2ZD5V03Lt29NI+DHxXHb4rfE9qCfpwdjbJ4FVTjuj
         3t6HFTjpwVUw2+zgjmRggAQQW1nKLCwpQzAnI5fZX4l/Zq2JiWAzNjNfwDpsjPEH3D41
         lC9y4VkFxzBrD6L93KE3MBX0h2BBfT6GJ2idN/YVxrxDxVlTynG6P0QqLYRN14mZKIrj
         w5ArHVLA/lFnK0tqDeeLqYshRYcF4NTjG+cB+uZpcvVIn+2uIOPISIt2j6PjQywFRyLB
         8cFgToSXRNrdBNMdciSkUaUpZdW3aix1c50oOQaIiVvdV/8CW+ze/4cfeUPDGb19M7kn
         keHA==
X-Forwarded-Encrypted: i=1; AJvYcCVrvog5MhVLhumQbctWamqQtd9/PxpUxLiLbqogC0SzBgt4tlZQEbFoc6aq4RCKQsejj2SDCplEjj75tkQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFwQdKJP+M/JWLzdGzDXCOcHRGjbkCtRFmO73y/i2Mug7NI/Jw
	RYoRsZOxb3u+Ha1AVhlPgDJi1AHkNmGN6FfnVJDD+NRRmbdT4Obgzz1k5bf7xNM4nftD4Ck64ZD
	QMsLPg3vJBHuN82KOJyUWBCHYn9nv7SHR6Wgz84IEZ6Ecd0dD/HlpulPLvGLjAi2dMWRJ
X-Gm-Gg: AY/fxX6fKi4hSAHRWzVmjfdvsQ083UmAmrlfP6pcPZZG21ZrS/mfyJu7S/ejAD5dQY3
	FQs/LD3MbkPPifTuZBXJxuruHLegHKgf2wpyuUhLGT6AfxkjMxEEotWjGB+n1cAaGooYVjAhj9k
	vWcbB/g3iFraxJ4VLYHMpj7V5W16pUXL4++8jaEVuxzzrML1FONyj+q5MJsFXX0X9/lCbTEZiaA
	6EMtwHrhRmq9gwjinkdrnSTIHN/+YLU6ubsLWtov5EqG/cdwIugX7PgUlRjvMGNzlGlNAqF1kYu
	N7m1wQWHGL8dYfzVHkA3wQQpY2hhruDfke0ErGDcjpY11lm2jIBR2xl6sOU5tacpJa5RQwRI4ga
	ztw8NHQT4ER8aOAwJxOrs
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210941cf.10.1767720708491;
        Tue, 06 Jan 2026 09:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjf7OwaOn3HaZf8IWNrZ2eDSIxGAY9pKKIzvqd/zwCSP5LN8zraKCLgL67UkescNPyjj5pgA==
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210511cf.10.1767720707970;
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm282053766b.49.2026.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Date: Tue, 6 Jan 2026 19:31:44 +0200
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
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <x2md7iusj467bjmmysckbkehooua3he652qqwr3yzaoka4sjm4@pk6uy7hq2lku>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
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
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX0Pmh/WKSKekp
 CwAF189pZ8z1ekkstPIKMSyf6LyugH8y42suZlL2vhDPYCjtBaz4yibTflWBuFq3XNDQKVtWpKx
 sOBpo/nAh4PfzNlQDmMGGJInBXHFK0soeVTDNCqmnKv0a79YOUP5zEJJQAWeO2bTHzvyofQF5tO
 NRdByLwf2R2hIGjjYW7tZOHPN7lK0eRP2VzYykXaD21ApXbAykY7TqIU+Z5csKgQZMwNMv+kjP9
 LRsioCrw6dNHxIEy1uGflSZzvdPrzgaC4eANzspsaIBBFQjl6iuK/rEDEqijZNCyl4nCL7L948w
 mOaalip4Y2WOKlRBy/OZ9jS86Ez0qEVV3xe72ydPlij6zM+YaQp7g9pp3fGjM2V0S9wz9GmUmdk
 dptpd7v5TmEC4/0+jGT31y0+eTJTVhUiH3PgWsF6G5b5ftpvI9IMrD8rZcZ1Hbm01NoMbjoomTU
 UU8ljIHBJkHiNKa5nPQ==
X-Proofpoint-GUID: -bqQacpvjEq8C9skCbQa_vogl_2S_uVL
X-Proofpoint-ORIG-GUID: -bqQacpvjEq8C9skCbQa_vogl_2S_uVL
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d4705 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26-01-06 10:15:18, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

