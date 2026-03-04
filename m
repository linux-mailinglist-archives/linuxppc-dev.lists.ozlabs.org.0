Return-Path: <linuxppc-dev+bounces-17697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGrACXP1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B71FD1CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmsz4FbRz3c4d;
	Wed, 04 Mar 2026 20:03:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614999;
	cv=none; b=Bdl8C6C87LYwIIWcu+wlGzfpYCpiXd9QQ0cz3efZq/ua3u3uo6UIp160DONLa4KV74Ondw6GxlVVlJKl+iyOOpI98n3zY0acplAb3c5zKhr8YJDl/2pEL9OjwNco+hEMPTopiaNR+qEiPSNXFPSSfMkQNqDa31u8UtZ5HdfuGzVctGRaGYD8r77tpNhiD5ewTyMNBFwiUgws2OpQrhXb0fLc7SDcy3H0VkEJbHqTtxXj1M88yltDPEO8DMNktHZ5GBz3//gCUdUf7djTP3mAixtGP+BHuSR32QPw4Lkm0T6gILwASZ27e0IhiAB4DF/yls1lF7ph9WP6oT6iQdpXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614999; c=relaxed/relaxed;
	bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hm21EqXREGiPgjKo2+XSa/szE3CsLamzHnyplPpp3u5SrK33glCI7B60RmVyjoFpR891aOMKCDET0AkPbzQvwn8Q53gCYL7C6FAmZO0U9OBcJWl9ZW0PIKWYbUbpqtGBR0onw6XwznzMNKPBB/JtbBTlFEQu4jsTpcn8Bsq/G1/Z3+Q8rSO3rMLFUdm4FuetyYp96cYNxRwWh7pDgt8moMie9FUMjgDSVCUAs4B9BDXj03vsxQeQfqALLnFHFHiJEdxDlZW4+eS1y3jmf3KiolIl/T56lH/P4aBct7BJu2p/0n4k8Tak52mrYCZr+DS4MhfHAesGJ34yC2yHpFREtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXlKzKtt; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dToSW4ve; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXlKzKtt;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dToSW4ve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmsy6BD0z3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:03:18 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Sk5r1073075
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2026 09:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=; b=WXlKzKttibLWM6lY
	USy99v7KTATS7VKSoUVVsokh/NLxR/Vtw7+fgvlq6IvC7nR4qN2bdu1yNOfsogF4
	Y+FC+n+OHC6ukxVkLDk1BCTbc9FLqCT2gQdaXUB7/p/6ONCdxqXUzWnlI9J+qk7o
	MQkacFzcPx3Nwp7ElGN+kvyruwaNCT89hZFpiaSMxG4+Qkf+S543tynxMrxMuGkI
	Tt3W/jGDSXVGe+/d9Dw6BjxYjtUwLQ8ZkGyfZP5MVGxmz8PbCNKm5KC5b5zPQhe+
	cD8U7cjo3vyXtkyRSYeZ38X3hRSGuebJ0FDseBxnTMLAfjBVXb44o/UIPQxm2F/H
	+mA3Mw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:03:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3929960785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614996; x=1773219796; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=dToSW4vexcGpEMiHIzPjlddR26CD35i9ZHISAU9E3ggSx95lhtBWTvLpx7fOred0w3
         S6kB7ReA8t6yW1uOCfPJKo6+uTdWY/wBR5ZOrJ793F6eHidwX9SvOnzu7MB77afDP9Nm
         dImBXIhIORLcWVvK78yIU7VUqRyN+HyKitCTlNQcEPldNHYtMJW3i+7/7FNEelifb7Gv
         Xrk/R41LJOJ7F6+a3KwXwd+amj4c9+LBKNOxDZ+r2bntBYq/Lmd8aCQVyzizZu1uDxRS
         xDeYzJcMl4qQvHZayhJtIrTl6X5K3mQbbr2MHa7bsh+EvsVs4CZ/CQ6wB4NmIv0PIecI
         sSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614996; x=1773219796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=bAelO0SSpmz7JLsVW62/rD5P1fJAlp62gc8LTvxWh/YqQv3qHvSl/SdE3lL6Y+1X46
         sjo9QIiDcUGrJH1QvT8HMif6WJTrG8ppZZH137NlovwsKoJ7iDH+ukQPa5X+Z/Xhm/KV
         3YOn9e4/YVVv6ydjgqwXBlb5/p2xxfnjdmghIbic8gUwI/4q6AS0CLBSpnLhzfOSDvAu
         LYcNr1argWLKecjs7T1l/9COpQbHOm/V2A+0e6uylkN+rJMkN7qYPdB5jZVRI/0ldepA
         LjAhK9Mg6qyoFeh4pjm3Fdtu0sAeneCxit8MvkojJZXyLkTt2nJvmXG0pIUwXrZNWq8P
         KjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPPRVJYsFb8JZrg48DsM+nzmOd+9kSM2OognW2Dflk+zv3iZCCUScOBpRVjCh9iLRd9vQlLL1Nm9J631o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVExB3l/JlmwybEedad8feMq675yoCCFUeMLV1xaHQjcHQpSOQ
	NzBD8Z9hme2I7d6bfrmrQ18tqp5Q5pl6EFeA71r3DND3AVaYtbPImTvgs72j2piyGE9V5c05XTV
	jj+0KiRhzSHG2TylDZ7mm8yw5+YWxdOSEDUBxOPDmhYA2bB1BOr5BamjMwcEnxJ7ZEvHY
X-Gm-Gg: ATEYQzyk13z5k5V2K3NCKkHy1n7fEkCUFmoEfnjMKpLD6BM1RTs8SQPYwO+33r5c50t
	57KRYG4Nc3O3IqEWR9RSnhHlr2Pe/MDvajOU3cbEk7iHeulPYTbZ2jie1GsYLXC6/viWYB5/E7+
	BncTfR3+geUQ+b1qzrbKRsXSwH1NVrJEC+ZR2Qt/3G7BslfwriZ7fDEcOWhrLQ/OjhE9fDOadX9
	0KRt5jVK9VS1vZJkIT/GInPYeWZBVsU3aNPKhsgPlsfox8X7cDA+y+bO9dKTbKY1ECB2zbghvCY
	B1a4Qx3yF1Mw+W1xG17WuoJlBbedlGwKHGZp9Q81Ll62XPy3iEB5OclafsQZhQge2LjjslBQu3E
	CEIPxiJKAMTSnIqtzKIcv+ZKjdFn4WK1qH1X68zFWeEiw6pqatE76
X-Received: by 2002:a05:620a:2681:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cd5aec6a25mr161917285a.17.1772614995760;
        Wed, 04 Mar 2026 01:03:15 -0800 (PST)
X-Received: by 2002:a05:620a:2681:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cd5aec6a25mr161910785a.17.1772614995108;
        Wed, 04 Mar 2026 01:03:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:27 +0100
Subject: [PATCH 06/14] gpio: drop unneeded Kconfig dependencies on OF_GPIO
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
Message-Id: <20260304-gpio-of-kconfig-v1-6-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fbp6KU0HzzSL9Nt1PKq3lQF7ufXuCLrwnMnj5C0HYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UvwNV5i9DxT7xjaoFV2uDvE1EtMAw8HvDnM
 8NpI2C4iUaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LwAKCRAFnS7L/zaE
 w8AUD/9BUoN96u9/mKm/uAVbSL9A8gdaZT8sxstCTm+Wb3kNPQjGD8iuR7iWT6TbKfmohsn9mhv
 ZNcnoB5aDrTz/qsDmdz58d25eJFcJaBRF3Mod6qXIAFavIrtFd9kyuuEz4jlB5guPGWURaaL7S7
 O7qh1Nsy5lFlIYDnki35NfBPYLG+JsXbf14gYYyHdIwzrKekP2hipib8XCuAD12Desq322adTDi
 NzCT+HX0IcYy2Z88F4IxHURwqWEQ8CkxFn1VlQnqD4QGx6Jq92M7GEPIvvayNwApGNw2PEkAPSZ
 Mg9upcBiTom0eCjPbKtsvpWqRZlkWHqt3bUOKoF2lCd1na6X0E3nHh662NWPu1c/nn3urNPkuHQ
 RH41caQIfICXnHz71sn0fiz8MsCyT+dpC9I7PZF7g0vvglGwkKYsUUyh+wNWIXHkpCA9lSiqjlh
 dEUUGBcb8WktVVX0tZ/+oj8KOfjCLkuGR2LEymQAs098UKVi8qQjRSlblbaTE+kH3IkJ9fBRxG4
 AdxSmxfyenMVl/wPl2jbnDhPs0hVGdUFWvzH+zRSNNhs//hKHgkXVnbq5qiLKiuhaapt9Blmk5t
 nArxmXSIGM2D1wsFIJe0ZPAfd/39foonWe26GIsOgfxtz8tL1ABdrnJQXWL0vIu5AEeG9qRwa8P
 8nI8rPipspBLORA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: F_tRfRqwbIZlX_JzPb0ksEnmgHG8PTBP
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f555 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=os9z4gxJ5ke727RypPIA:9 a=r15waxpOa3ezfu1y:21 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX3nL3DSnrz2KI
 GQ7zzqKooU6cJ0QBfn5C6KA0SFi1MvGnv8r0/V4w++o3D0F+TrgV+MwLDZ892AONHeHRUb7qZIN
 hffUM6bjgJnsyHkuj0tFwt1NFlPhd9LNMSa/VeF14+XFwTiIXyYuGXqwq5wvVbOQFN+bkX4htrc
 c8dz+fa5yTPSeUyq7B0A30PkwT59sG1fx+ojV6ybYpAIgNCNLUNj0VBdQTYJUlC3+mhMpEc1Aul
 w4dN78p5ukQ+iP991AEHFvZZzPaHQu3HG3LgrHckzB6JLCxzHofEKzDtNYX5yunILS3pnR89ezs
 123g1oUq6O/mjo/tBLBvD6m3+Yl5swr/dsIA2gOKyZ6ThfY5Ft+jOO9WE0zxY6GntzY3AoRDyVG
 0oxR22tkiGYkYqGZTAqOwWZmyksglGUmV/Wm6uqmR8IPB6HyjjgY8FdGbaDek69ST1A7JbvbFlb
 unBzckJRsPRTowq07MA==
X-Proofpoint-GUID: F_tRfRqwbIZlX_JzPb0ksEnmgHG8PTBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 329B71FD1CA
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
	TAGGED_FROM(0.00)[bounces-17697-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:abrodkin@synopsys.com,m:vgupta@kernel.org,m:oss@buserror.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:dvorkin@tibbo.com,m:wellslutw@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux@roeck-us.net,m:wim@linux-watchdog.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sre@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-leds@vger.kernel
 .org,m:linux-hwmon@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-pm@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. Remove all Kconfig dependencies/selects for GPIO drivers.
For those that have no other dependencies: convert it to requiring
CONFIG_OF instead to avoid new symbols popping up in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig | 53 +++++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c19794e56bbac7539250c09beaeb7..e649384f436e7fdd6ac633d9caad94bbee724439 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -145,7 +145,7 @@ menu "Memory mapped GPIO drivers"
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	help
 	  Say yes here to support GPIO functionality for 74xx-compatible ICs
@@ -175,14 +175,14 @@ config GPIO_AMDPT
 
 config GPIO_ASPEED
 	tristate "Aspeed GPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
 config GPIO_ASPEED_SGPIO
 	bool "Aspeed SGPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -201,7 +201,6 @@ config GPIO_ATH79
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
-	depends on OF_GPIO
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
@@ -218,7 +217,7 @@ config GPIO_BCM_KONA
 
 config GPIO_BCM_XGS_IPROC
 	tristate "BRCM XGS iProc GPIO support"
-	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default ARCH_BCM_IPROC
@@ -229,7 +228,6 @@ config GPIO_BLZP1600
 	tristate "Blaize BLZP1600 GPIO support"
 	default y if ARCH_BLAIZE
 	depends on ARCH_BLAIZE || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -240,7 +238,7 @@ config GPIO_BLZP1600
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
-	depends on OF_GPIO && (ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST)
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -248,7 +246,7 @@ config GPIO_BRCMSTB
 
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -280,14 +278,13 @@ config GPIO_DWAPB
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum EIC device.
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on (ARCH_EMEV2 || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_EMEV2 || COMPILE_TEST
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
@@ -329,7 +326,7 @@ config GPIO_GE_FPGA
 
 config GPIO_FTGPIO010
 	bool "Faraday FTGPIO010 GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default (ARCH_GEMINI || ARCH_MOXART)
@@ -383,7 +380,7 @@ config GPIO_HISI
 
 config GPIO_HLWD
 	tristate "Nintendo Wii (Hollywood) GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -434,7 +431,6 @@ config GPIO_LOONGSON
 config GPIO_LOONGSON_64BIT
 	tristate "Loongson 64 bit GPIO support"
 	depends on LOONGARCH || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -447,7 +443,7 @@ config GPIO_LOONGSON_64BIT
 config GPIO_LPC18XX
 	tristate "NXP LPC18XX/43XX GPIO support"
 	default y if ARCH_LPC18XX
-	depends on OF_GPIO && (ARCH_LPC18XX || COMPILE_TEST)
+	depends on ARCH_LPC18XX || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIOLIB_IRQCHIP
 	help
@@ -456,7 +452,7 @@ config GPIO_LPC18XX
 
 config GPIO_LPC32XX
 	tristate "NXP LPC32XX GPIO support"
-	depends on OF_GPIO && (ARCH_LPC32XX || COMPILE_TEST)
+	depends on ARCH_LPC32XX || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
@@ -499,7 +495,6 @@ config GPIO_MPC8XXX
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -592,7 +587,6 @@ config GPIO_RCAR
 config GPIO_RDA
 	bool "RDA Micro GPIO controller support"
 	depends on ARCH_RDA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -642,7 +636,6 @@ config GPIO_RTD
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on MFD_SYSCON
-	depends on OF_GPIO
 	depends on ARCH_AT91 || COMPILE_TEST
 	select GPIO_SYSCON
 	help
@@ -654,7 +647,7 @@ config GPIO_SAMA5D2_PIOBU
 
 config GPIO_SIFIVE
 	tristate "SiFive GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
@@ -673,7 +666,6 @@ config GPIO_SIOX
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This driver supports GPIOs via CREG on various Synopsys SoCs.
 	  This is a single-register MMIO GPIO driver for complex cases
@@ -683,7 +675,6 @@ config GPIO_SNPS_CREG
 config GPIO_SPACEMIT_K1
 	tristate "SPACEMIT K1 GPIO support"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -699,7 +690,6 @@ config GPIO_SPEAR_SPICS
 config GPIO_SPRD
 	tristate "Spreadtrum GPIO support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum GPIO device.
@@ -707,7 +697,6 @@ config GPIO_SPRD
 config GPIO_STP_XWAY
 	bool "XWAY STP GPIOs"
 	depends on SOC_XWAY || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This enables support for the Serial To Parallel (STP) unit found on
 	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
@@ -742,7 +731,6 @@ config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -752,7 +740,6 @@ config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
 	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
 	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -760,7 +747,6 @@ config GPIO_TEGRA186
 
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
-	depends on OF_GPIO
 	depends on SOC_IMX51 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
@@ -780,7 +766,6 @@ config GPIO_THUNDERX
 config GPIO_UNIPHIER
 	tristate "UniPhier GPIO support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
-	depends on OF_GPIO
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support UniPhier GPIOs.
@@ -797,7 +782,6 @@ config GPIO_VF610
 config GPIO_VISCONTI
 	tristate "Toshiba Visconti GPIO support"
 	depends on ARCH_VISCONTI || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select GPIO_GENERIC
 	select IRQ_DOMAIN_HIERARCHY
@@ -806,14 +790,14 @@ config GPIO_VISCONTI
 
 config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
-	depends on MFD_WCD934X && OF_GPIO
+	depends on MFD_WCD934X
 	help
          This driver is to support GPIO block found on the Qualcomm Technologies
 	 Inc WCD9340/WCD9341 Audio Codec.
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64 && OF_GPIO
+	depends on ARM64
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
@@ -1111,7 +1095,7 @@ menu "I2C GPIO expanders"
 
 config GPIO_ADNP
 	tristate "Avionic Design N-bit GPIO expander"
-	depends on OF_GPIO
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for N GPIOs found on Avionic Design
@@ -1144,7 +1128,7 @@ config GPIO_DS4520
 
 config GPIO_GW_PLD
 	tristate "Gateworks PLD GPIO Expander"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  Say yes here to provide access to the Gateworks I2C PLD GPIO
 	  Expander. This is used at least on the Cambria GW2358-4.
@@ -1567,7 +1551,6 @@ config GPIO_PALMAS
 config GPIO_PMIC_EIC_SPRD
 	tristate "Spreadtrum PMIC EIC support"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
@@ -1606,7 +1589,6 @@ config GPIO_SL28CPLD
 config GPIO_STMPE
 	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the STMPE I/O
@@ -1615,7 +1597,6 @@ config GPIO_STMPE
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
 	depends on MFD_TC3589X
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the TC3589X
@@ -2005,7 +1986,7 @@ config GPIO_LATCH
 
 config GPIO_LINE_MUX
 	tristate "GPIO line mux driver"
-	depends on OF_GPIO
+	depends on OF
 	select MULTIPLEXER
 	help
 	  Say Y here to support the GPIO line mux, which can provide virtual

-- 
2.47.3


