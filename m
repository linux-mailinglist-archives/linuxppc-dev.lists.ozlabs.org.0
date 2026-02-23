Return-Path: <linuxppc-dev+bounces-17056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIqEKV5YnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA191770A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMP63qjgz3cFq;
	Tue, 24 Feb 2026 00:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853882;
	cv=none; b=LwWSuEEwrSGMLMY7q/kWnfzrcW7UUQn/3heoJmcFoKHZp8f/jGUXY3mpNA4AVMleuPSZcOOQUMO45Un5A8/j7ksZILOTSrBiFsclboX1qRf/Cu77XUBkw28meR20dNgUiyIJicK2IFr2mh37Vppka9RmMvwINqI4DoNVKJRF+y1VRss02jGYv0Z2gpukxx6F2eX+Zt4aDjpzn9TDqVoFs5xIEXR1IqCxlPdDctCVzyxox9HSxCWJ3FITSsGVIw6+iQMHHWQTVuG5gG8O2WJJEqbSfwrQt8drvI50dxMztKvRrbEyveDbZD3A5Hl8EnIbMMtWhsput40Eh5C6AydVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853882; c=relaxed/relaxed;
	bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIkDD5F4vMOXPwBXxojC9kcpJz6vtj5GG1zrgqXbiQw3pIEjKoDDQyE+/orqDGTtOChS6Hl69biRgeWiLMbMLxMc6HVcvD2Tov52nvpiDJxfg/hpQG6MSQ+cVvuur7O9cbG/o+1oDqPbaLTIyauLEBjp+PhCK9ELbhm6sMAwH9ldEDAdIvm3ojOQDTXgu6+Bp481/DblBMXu53gszm8FLzVw6NmWqffYFFAIVvc+lUmF533dsJhM/82UH5dgJrmgq6EonCIRFUhyEUa8c3QkVfSjwN4fJC1viDlcS6sSjSzcsHcqW4Rj8XOYx1HrwgXZmfhN2qNWsZDEylCUoJC/JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKPEA8Fg; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHU1COB7; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKPEA8Fg;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHU1COB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMP55Zmvz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:38:01 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWjEB3698130
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=; b=FKPEA8FgiRKeXm9J
	CxfKM9/iMzcE+Gk5wEvWu5Kn3jdWqUGr4q+mhSly82EPrBiUZLxmUAId5zieD0uS
	b/e3qKrZ7lX7XI5ePLkFOIyloPBK7ln4unmLKt5bHmraRfcAGEvRnLt+iaI/5zYb
	cKk6pcUAvtErYGISlTVYtEiim/TRnJQGZqxYraeoRaYMZU9wvyrgmLjSTfYdkzRx
	/R+xQOGvH+Pn3gsEn8ZkZw9rmVRVENB1Q0u0XrpcSDSyzYmAcD5lhOARsBPaRyOj
	nrJACCpNaM+0mIP4So7pfxAbupEy+KKuG6Yp3xsBfZpKCUV04i2M/vBn6pfbtjP8
	TobfjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ff05c73so4283027085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853879; x=1772458679; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=BHU1COB7KhPYdmV4u/IUDKMjFVh38f1d2/yMAnbGgDsrMgjvCqWoEeduRPQZ0gXZBq
         sBFeEbww6yRFgkfj1BZCCeyelYZOHRnN9Y5OxCBdsyY0byt4XQesmetQRw74G3SdW+oN
         Ay6+aBsnJT1GseEmnNeiXOgWXFsT4KO5fUQI4xE8rs30h1NXOWx5NrF2XmDHQx9mx0IX
         Ef5eetJTKTorDEPmuSUFSdSVEPA6w2I+xdi7uz8CFRxBTLXOS1rWPojGqMEkibCLY9XJ
         jy3lvkIjfDbo9pHu75+uCjQHHKbPpn+yu6DJMOXjlha6Z9KmLmL+awRmqAwNnpi6ceTy
         aumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853879; x=1772458679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=RkUTexTHIYiXKPH0pP6MmZ0ZReBthajRj/0cMJLnZD5AT5m2wm5uqlUdaloqKls7LN
         j42rPLOhuMpFXig9Gv2vi/L3LO/U8oxadzGZHvJstcbq6oiazCMoRH/GSaa93ZfIv/pJ
         aktmiiWDf2PTGN4obWydAers/EsxRQW1KMp8Unnnb5a6CgPesNrELHqLZmxfFPNAYkjV
         CSrODqks04uTNqHkQIwwshFTdFW7xpa847Wuf5hiqrzN/r+Fu+tkwCoUxlfE9Do0501a
         XB9vln5504vwmZgdmwoVS8UlEcevFZqiyAUpwBFDWTu3bAZBfoX0CNSsS1UYCriUkkcZ
         kMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUQupuGVBP/W7eLfeNOsBALb5f1vn9/BEO/X65iKKPmEnKJFM/W5L44rX23DACQ0lVQh7LF9YinCySNqps=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHyDEImLxFmlcSGsV96uGx4XxagrHzG357qB042okhAsN1aZeh
	fQQkD81sD/C9C1+cwB3adv7X1hBqSPpBTP+qPQPhjehWtssb6ljFFTzDiXZi+6uRuT/D6cDqysj
	4jKaeI6wYbVwphMwqK07c7Eg0eFNns4lxrYWTLZevo3q634LpIYCmiKryjeePcP3GPdup
X-Gm-Gg: AZuq6aIfaErX4pFDHfabsaLiSMxCXjEOS1uPERGCxU5agkm6NSyGQr6vhBak6BNCqs/
	GOTZ3luEP4aVf5T8i+ju/ZVFWRvywhE32AozfueemsACLPvLTsO+ACKcWjD+7p7yzd/EwZOr4mE
	iDOzqRJLPexOs/4rz+YJNeKZ4cG8oawe7+hvqZmDRMemCMJxUM0746FBfG7VwgDVrLtFvucadC+
	i+E2j2JLtBDJ+lJOxR7/cgEPFmkEXBZP2NrGKELajmol5zJtPTTClj+9sayA1MBSe3h7R2lKlii
	QtAcC+JX3RhXZ8Rslb/NR8VtQ9xgpA1gkFH758vJJwQ5Mf7keezc8REeRdXRyiv1MbHWewiSmDe
	+BMVXyRFZ77RIekevzn38/47SA+JQIFSGmCnX5WuvhOI2fjq46XE=
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976095885a.7.1771853878672;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976091685a.7.1771853878214;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:22 +0100
Subject: [PATCH v2 7/9] soc: imx9: don't access of_root directly
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
Message-Id: <20260223-soc-of-root-v2-7-b45da45903c8@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFggsAfK2L599u52s0jxxDBJVDwECvhtJQ6BZ
 ShZXXzZl6aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIAAKCRAFnS7L/zaE
 w9TLEACvx7EUOkNExR6rxJvbiPrwBxde+MzYk8WnOY0KUo2qQYe2IV3v4Y2OLkNQxLORHNTmTet
 tL8qdFdcA7/EtkfNAUf86JGuaHxQWgvPaQLo82VmtcJXrb3s4ChhMHQTxwSIzk57nVcuxBwXaoC
 d6cLiDC/nMwvrZAeyb+0Z1LBwzE7OMUXdzVztRyUlBioOA+aG7+h03mNocovFYbn8rvTos+rY0Y
 e7h5NIVlwUODtq0Ev51CGoFbC6CaCwiNXJba+UycfegX2W0Kkhwf0Zyi6DiT6gQq2D9oI1fRdMD
 xIzw0mWS+oLN1VnrqlYu5wL/Ku4iTSggD+ob4YpLXraU5R+wYi1r0Azeg8et0za9it4PFjFPnfh
 Dl7dYRS50ulZCrHTUPGGGGvZLPZT0QgfYfmQTBBovf+cs1qrWcAVJPUnA+5OIsPfTAX4tiEFRts
 P28q4vNQSZ0M8Ztild3VhrhzLubEMw6II5ymoX4cbhfI53GoFeJAcgxeL3sNXMCDZjbybvyP/7+
 P6DMYb8Zm0nYj6H3x+3/s8WEK2ZkHPtYYlR/xxt5DIZKaoXnhqi5T+1/EOjQ5KwLwJVLhLEEqcO
 /410xgEfAAQKBXmwObvlKe9pciFTnNXitRVoM55CA5VOT0ToZ4cE5MSg6+N9VqPGbRfWHk49buK
 slcXvQ/kjdLSnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: dnywmeqT6TsLfUM8jaoQcNS_YoMC1Rkh
X-Proofpoint-ORIG-GUID: dnywmeqT6TsLfUM8jaoQcNS_YoMC1Rkh
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c5837 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX4w8hZVbcyXPt
 GYzjcQbIAlDYoKG+9O013idsce1Ez+wkgMCpmaS7aQxEiJj92TAB0D5itCRYDro7XF1W97ALp4C
 xvtVbHSHHRw0koJ1r/Fx9nZ31a1biGS0XQsTztOEwwjb0kdsVGAHgp38gA8e6R4FVblhmte6rZ9
 sl2V1GoZIWCiJXQ/8ugaIzLEU2O97ommiqmf7uLxHpsRwXoN81q3Phop+6q8Hy72Lteio69zhH4
 Reml4d0h1ZCxxptNOnhVtz4Rma6yvLUU1gEO2xapwyBDJ3tKAIcDdnb4wgSC2aUoWLKjQeG9EBR
 J4uXnHhrSa/SE7zbCd5o2VSiVJbzzQgHV8MRxM3SqhqHLABqA7wD7hEcpjj/CvyA89OrcmLr4Y0
 iDmiHk3TDUyIxL2LUFWGVzW4Bn+muECZyA2/PFv9Ti0B/UFombNMgENc8RQrs7Y5+Ty+he9jQY/
 tNDZ4sndqQnrk5bVVbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
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
	TAGGED_FROM(0.00)[bounces-17056-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:peng.fan@nxp.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email,qualcomm.com:dkim,nxp.com:email,i.mx:url]
X-Rspamd-Queue-Id: BAA191770A8
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index d67bc7402b10e2966ff77cbf3b15c087540bd377..58eef7d4f9089ae56891507e8dec383e69884ec5 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -30,7 +30,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_attr_read_machine(attr);
 	if (err)
 		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
@@ -89,7 +89,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3


