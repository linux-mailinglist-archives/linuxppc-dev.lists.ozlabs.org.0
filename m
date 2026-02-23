Return-Path: <linuxppc-dev+bounces-17054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLEiIk9YnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF024177082
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMP13CH4z3c9d;
	Tue, 24 Feb 2026 00:37:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853877;
	cv=none; b=foA1bnkKOBYH9eVh+do/oENgVPoCVewmrw2T8TgmvksK0JkZIt/LwOqgTieJqqMhUeHpLJKFIdrweqwN34WBi30RCzmiNLh2PogeFeaBgkSb7b/z/JW1kQzypsgEUyIIqT8cSnuCPRlZdOp7CdJZ1ePK1T7S8HgcDAhZs1FdgPQeC1xNGoimbnrVayWCAxJ964MvA0VTaqlsX4H+lLIbWnzAt0pzfSNuClBIbIY22XklNiRZie8+KcqLwLmIGjWElsmHdimdeALSohQxaIA3yGSnddOsqlzmoRbh2mkzISvlEYhHb6FNpv9DKp+eon5pi7czf7Ynn9+lWibKMXAE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853877; c=relaxed/relaxed;
	bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bbx9l/pjPDypWxTjiU+u5pDlQE1Ac/5Hlat2cqdWcB+/nxRSOeC8mzH4XXV8U3snh4UuDbPF5GsT6GxbC/8StnDtSnMCeXVA9gv70DJ2UFKRj/DRm1t7msMWLUB4+lEjUmwlHr44V0hXG8duxYVrjdTibXlaFJjLRj4V8L6MaeLqj08pZfX7Wt/uceiQ6yq3HUL9yHYBdvphIpF3BRoNul5vNYyRhl2v2tm8q/478FQ3qpVFPMLrmRw/d+Rorvp7JAPf7aWq8cRTemD2hKovSL94370GrObeGtIM1tr0sc+GHIF4vQ5KxeY0rgaOUhwY2ntN6pLP/nUxHA1ORA7raw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzKXoOxi; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jk/4tJM7; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzKXoOxi;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jk/4tJM7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMP05B7Yz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:37:56 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2hDJ3151782
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=; b=nzKXoOxi1bY4uY6f
	tR5QifCU+ODEzdpPNtpBb30VXXdbcFX5oPrIf32P+RL1prGWNb3WkWVng4H9wU9n
	RVWix+32OD6W/2RCVs6sC+7UEuzEzYC+kdAiGc4/caAz+S8XOBMZmg8w/D926Uvr
	sWKrRRYqMAB2cahVvYOEGd32s9WEF3hRoRGulqAJAqA9/7TeXNWzDB/OfdKE8gDN
	in3i3Aqf5bi26oi0UjSuhJ9sa6zQd7hdzCWDkeDzHKQDFk+QYcJZR83JC4+UnhVX
	sec+mtHcIBvBsFhgXbQztpfjJ6SgiXiQ7WnFWx8jQf2+7StJWGOcPFgfsQzv2EdH
	eeqPcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj887bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so487993085a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853874; x=1772458674; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=jk/4tJM7Wf8CtzworaBCS8HpAHaMA5jCuAV4jxqlNmmtsFY88ofqn0/O+FHDOHPrLv
         sY6yvg6OX4rJEVeVOPg9+0mFAPot3VUsBv/03ywx6Cc6JM+BQLMsS2g2xoR1lFrL3UKL
         C3fhnxRL4yM8YJ8Me9lHYylqBlL2kLlggleFsT+7RLi5zidQ6eFw9g/aGjvDwrFfAD7j
         kJckHfKlfGwR3Ei0WSUKbnpxxA2wtrZ6xfoU/rxhCTfXFQqAwig77BCQdlEK8aHB70jq
         xbJRPAzmBhk7BzEXiDrXIDiuWNLmdIOA8qRjfbpsfp+TPpFo77VjfFRLXJxqLlCRrXTM
         qM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853874; x=1772458674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=imhgcU/zn9n5J5dN8g0dyzFG4n5tkRr4IT/zoqcn+rdgMOOYcnv89THBATSgTvRR8f
         v4kbVcgTG0xrTlCneS+oXV+91rRFw/Eb6/TGHleXLf8C/H7PskY/UUY6FEIp7vMv9dhu
         4IDjlRahQhVVy94KdYY5viHlCj2TScFAueHc7KExEnGbFRewMqLSv9+cXhxm8RYQpiF6
         okn2sPKT0zURfwN+feB4eSZ1aQnVHwPrp0n4O2ljIG0Ml+ec3YZauomA/o2ZVSWzH3Ir
         2f/xD+p3eegFzV0Jzd96RiaioNUffwHXHF5bHjoDRVMHgHLan7PrmxdQ3oYuni/YrrRy
         8EhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf4Xl9irORCvk2Uy7tepwidMxag9LdABmnJyMLxlIoxsoE2DlkXMGqFitZgtAD5r1ecRras7mH/IGKwIQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySwR7nF2RbPPU7PpIgkfJKXDUqebOKwVdmlPN17+9yy/feTIPf
	7dHfBPtnyKEoszyAVMbjKo/arQd1PwldErenBPBXLg14cVwCdljsMfvcfuRtHhiG5k1FUoQkzwd
	W0d8MTeZqmmwBpWcS9Q+JjWNj0Vww/8E1raFyUx7aAa1KnYO3t0e3WJPhmFsUvOHFCmdM
X-Gm-Gg: AZuq6aLJIQ/ZAeas1vPcU0g6j5SHfdxHb8xWhgcODARUf8MamDW9WiU7HPtSkZepRml
	11S1QMTvOKTy4/ew/E3xXqb03VWu4+YvzQ/0ik9iQs9f8VQjOKbAV5yduroJYe+MUuD0fzgmEzn
	2gCq3fkwE+fBkhtMyePUft8teMa8veI1fc+Z6w+abDbIRXvY3iDXNlRhe/Nr+RPhiv+X15ETO76
	FJ1eb7SRVCibuSC4ijc1r1a3WccN+j1FCy2+mcmosUhFPLuqUsCau7uju4+2Fdui6CymWYzlVu0
	5GRu65DVTQIoEIbJ8EhyXZXMSdrSDhbOxvh3VPgSewaIgbkHMzziz19a1yXthkEJWvkxaVwoOkD
	pS7CVzxXgUQn4Mw8vyTWmOWV2jj9G9/3bQuVSjuBr3eemBxSkLjo=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996163285a.51.1771853873895;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996158085a.51.1771853873383;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:20 +0100
Subject: [PATCH v2 5/9] soc: fsl: guts: don't access of_root directly
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
Message-Id: <20260223-soc-of-root-v2-5-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFge4NKs5b/HhZf1FqytouviECXWv4CCayjyG
 d2GXKvSbGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHgAKCRAFnS7L/zaE
 w+AnD/9o82yUVcRX/EDQ8/rDuhAdTh2ARj4bZyZcBUwlc2QItKJYUxWDovnXoZAIJgHTPdXvkNt
 5jY1LxpMojb/ytP1LIZVcjj4CZeP576Vp4g+okrBBq0flZsfk+pjYhYudU7x0W+DJU8R2c6tMhR
 eg2aR0FEEY7kI6pdoUzDoLUp0Lnkw6maSVRVOD38LY/rOsdoe8H3w4pccAPnL6HkTwAAI9sRemM
 stnYdqeTohQktd73UDF3oyLdoQUlNcIMWGCdktfobl/DsGcWX8DinfBpx4PVxFwinDExsX2q23/
 FE5ho2KZlH1ccbvjFOugOdsnRZKYUHFsH8njc441CExac7ECXdL9lxKXh0DHGxPix4Se/UiU2RY
 48AucP0vyJT+EQUWm6t/KFhx1u0KsB0S/AZB+4anFOiTiCQdwi9lfJGE5QnfghNVwv/HpPyRaFQ
 GAkMfxvZ+klkP9uJQwDhHBMSsO5oOuiiYOx3H0/rP2uVjHhwEb6vNv1+7OXvvR3sDIqRONxFVIY
 sZQy7dQlB0NJCSPTZS5iHvBq6b6Px9ywpt1pFp896x/238b7PhE6HZdhE4SrNxaOx7/IcXkFEfp
 Tf51sYJdhHho5bc+m19NDDMTXN/fgysqxUXUF5QJliJI8uQutdcsY3juWrvuFIw/tURqSblK3aF
 tSSWnHAI3hqqIfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX2Rd56hmrP/O2
 GbDHLrTUkXM2cU2Ixm+7fvl4jiOgCzc7kU5lKldkXeEJ5zT6uEr9DdbcxIMy5jT2T2ZzfGtbPiy
 lhZ5pmODHRt5ULB1WCr4Wq2SyuaNlacYb3J3nx5P9+uTq8Ps+MlbdyXVsHj+i0m/5eyfdNhFJkn
 08vEHFMDTNdNfAYouQpXODWRkuI32JDeiCAtb/7rMKeupIzTkbK6Bqn7ZIl08NQ6Axq1fQtr1e+
 9ti0S/DbX1ZAlLDKNlwx+9oCbFZvrK2ODK5qAxJSt7Er6HNajeCeWMuad/0yca2w1tOj06WpiBQ
 Wd83Lz/n2gi2kvWCHD/N2ZPCX721tJLYSu7podm1G2dCUnbmq3JRMiY41zMev2ZErG+vBKD7vEe
 7vBglBr9F+U3XnWUMMmsFRbYmaNWS7SFCsYHABYkJOktsOL4eeJ2lDL4Ye1YvS0H15O/spVM3mO
 JaN/r2dN6jvhE/TZh6A==
X-Proofpoint-GUID: x5jsdvvCkiMV_BCvgEDrSLZmWSHdrqWg
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5832 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: x5jsdvvCkiMV_BCvgEDrSLZmWSHdrqWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17054-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DF024177082
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 40afb27b582b1bbea004ca91b96d0a998e7a6582..9bee7baec2b9b3a548b16661f9ba86db2b982910 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_attr_read_machine(soc_dev_attr);
+	if (ret)
+		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


