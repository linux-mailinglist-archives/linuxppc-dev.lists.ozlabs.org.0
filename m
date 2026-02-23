Return-Path: <linuxppc-dev+bounces-17025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OTIGDkXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423017362F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDS4fL6z3c9b;
	Mon, 23 Feb 2026 20:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837208;
	cv=none; b=hRTM8ecwS6z8koQ7aP5g3840k+XUi/YZp0ICFalQRgKoCFzQFa124oDxKiSMptz6LcZdZyUeq3KUvNdRvC0V+Vv7G535+XNdOMsf+PaW2OiG+AMZDuUlbd4HDQLh5knowliCQQeaK/m5LMJweQvCKUA4C5IkHg518Cygaqz+Ul3Gv4R09NZ9F7RVbe3yQJBrHHfhj2C3Jmu+eC0bhXfnN1maaKUdxpzN+7hUFD+77ODG7Y9egeOKrpiZ6WzBigwf3pRl2y5nbG2eJudYWlufzkXanj3pD3S6+osCQUWW+gM7ifbW9DSppyV4+BGssvOWBJSphycfEUbE4x/X7LcVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837208; c=relaxed/relaxed;
	bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCWPjv9djqe4JF7IrZPwXW1AUJIbTOh0WEZIckcOsY5b66E6kzVFFnlEVtqmuNWty5jyFAOMDfNzkGDdk04FgONBJ6WAVU9kw/7aIEUh+gEilRIIjVBd0fJBmHnD/isOkPM1OAlAd5ry/YnBb3zjxKXDDweYQrS0BhLFgcmlE0X377PHT3KMjAoObedFJWtOtsXIlpd7n+PHKjYLLZHYCSOPlQDCjv6ji1oGVFdiwcxWLCYbTf5pPxLpCF/E+Uaxx/oy2L5q4NueQ24QIY7aD+rA7HR1dskwKZPRgVWmRQdiErBRZyQtwcvOY1YZa6YpCD+VmylFTyjBdipLl7DPdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NqVMtq+t; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zau7r2Df; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NqVMtq+t;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zau7r2Df;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDR5MVbz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:07 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrhtg1882198
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=; b=NqVMtq+twfczC/sc
	BwttqQQL5StjbFbLr//QuB0+TOJut7qV/VQB+NBMZkjtTVI4sbR0Il1x+OMAg7mv
	IoJVxVj0pMUHqSURupsBor9GQry7DNDOWmuK03xVzsY7aQ0sQvnoCvOFZGxLE9Yo
	DwZ9crgcdLy50eAkmTPD0YRUKjOhMwEyTfiZHFGAW0iHO3XSTcuTTBwzI9itV3/T
	wtILadGgeCeEKCEBI6PPyq+42q/PcWIhtK6THciR/yg7gxBcKLv0Ti99TNu6lndh
	LDlHEiwWLSYBk4mDdsDcnsffWyTE1LXANwO1zZTUY4978bHcQE8/vcsLsUpx4rk5
	VqG0Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so4603684685a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837204; x=1772442004; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=Zau7r2Df7ksqxKrFfcnSx1fz6LEQKbKQWiiyFnmEhONeyalsVltnzYOTzjBcAHnWfu
         erBgREmx6q64SUg4yEg3Y/gLegWpMhLj9wI/WD9WINA9S19Zx3jrJvwEKoa3Hc9pxXDf
         vGkX/fv60XVT1LctoVaOOMxa950kC1M/HJ0h9JsP9VCVRCVdwCt35RNEYaPrUWNShtPp
         oDre4mafsphdOUnWLF5kl1wtJP20O7gK9EjvS4VBw2KnB0h5gaRubPhPNiVc8eeXNimZ
         HFx3Egp6HxKd4MgmHk1blqkvKwhICF1rXDeNDlsEBei5EF7gqXuEO9XjUYguNFXSBMvh
         +oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837204; x=1772442004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=WarOsFATENl/XhQC/fXc5WSWHRsqQN9MzXdmnJm4ZEajiuA0o8H9b3qfGPyQMx004m
         oW68z8R8vB4xt0LFFTBTd8/PHDLH7/HVtu/Bz42r7iWP3yfYF7BDGARxxDGvQZlpmOvr
         HflnZrH+Nt+0bMuYVm5mstDrY4nbYbwTGbdxq/xfTKx3Ox9dgvXHkcml5DA7/+AShv+T
         RhfyXnoJm1WNeQ5B5zsoEtse20hSDK6/Jh1r3VqlMpmvGaQZ02hvfNAjn9jD85Kw9/TA
         Qad+yuPkugSes9xKgOLM4VSNfGw0iW93Cwwq0rSnEQ3wcQb6Q0l5ofzEK8cazOg858U9
         MAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbK/Ze2n75FRzHdS19B/48dEVSznLl68xTZuKidoQ5+GS+MtWMMWZb6s/we5C5DkvIyNB/jrC58CrG9zM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdSr/z0RK80Cqmso1Vg5+eDxdkImFlQyu7otSYrFM/MzUx0SCY
	5azWZtNRPsiC3Gl3Q8KIaTQh7kKpTPwnX0fHuNjGdHLRgsf58UQ9atHS3fcdCE7AY92dirKMJul
	4HXGl3ujAO1BL+bVinLCFVJ13UvGPstZ1K+oRS0W6qAiNUn07rqvq1eoaAVzgW1sNDSW5gAY6YY
	1f
X-Gm-Gg: AZuq6aLatnpBs/tX/tx7Eptex2ul7W3aJYs9OSni5fl+0YFVEDRd2NbpR3pIzjEMtec
	omNnR/aXZ4CGxE3huiS0y+ZFtunUJ46snf3I6FLx4tvnHkP6FDuoVOJ8fdZxMBivnPjbi7deJHP
	BW3vrHJgdovOMzx9Ve+D/INy0iCk6vtFbUWx4PbfxZs0UZtLSqYRsk58MYlZt/ah3T7cXUQkzDA
	X4zLsDsYEIyBWlqenPY5QX/5v+N2V5VJzKDHQiJn8luAYYfqK/mzVETwc51n12cb9PZHzsS65jk
	7t+VxInDdKjY2uEKrwe3fwG438tjospkmxoo0HXsMmo4k4m3eI6D4ikYOjyosihJay83ky6p9OH
	Wn/aQ/Bb1YxBzHWnEUD7OtpVQsSITsvqi7naZVXAFgc7fmFZcAmPw
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884735185a.45.1771837203925;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884729885a.45.1771837203404;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:33 +0100
Subject: [PATCH v2 04/13] i2c: mlxbf: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-4-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcAnPQSTaMLTTpvB+xaAFz/B8dcwj5+aqUFR
 iA84Gjv9H2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAAAKCRAFnS7L/zaE
 wyVMD/0SnjD8uJViNM3tDR3CtAnfjAe2U4Tf7D9+q0NnRBNoXRo8sg9cFIL6nR6WVpwvicqFXKD
 LBpoXfdHQMtJfC+b9ppqw5+DNYXMG1syx6rrkvpTGw5Dd0DK5EhAafdd9+VmVrktPCBLDLnzWbz
 jVpCHba/RMWLG+wQe+Bal9ZZxunBPXcvJuK/xmpkLd+JbvqHr34az4mxrCpDk7ZKsFIBs3pd+2m
 H+L63R6NlUKQPd8YKdxgzD489rrVNkNagWDEz2DMOXRANIPSlXLYZOQn9iYt3zu9Uo8h4Kg1l2V
 OewXYuZ63w0J08ozkHp55Vlfg/jqmpuBg0oifaxNc3t2zCFx5ykBJ/9f+Pb+aLPjPF671G+48B3
 g4L5GdCTdn1lypk6SK8jVYIwcTZEcvXPY9uYi9lgiA1mOn9w+iljoViNBJRtC6JAO7x//pW8DA8
 +PKSUINSOaw101BElBgFemtbN4N4879wZyEaY+RaXvwloqTnMrDnpmi+rcbTAoUXUbGMYWmkb1k
 8oqCYSA6I+bYfIAguWYtxgGUgqrxTir+Ky4rKJUijbzaf4RZ2Q0JE1/tssdWWLrFNGGHnIbLe1H
 x5Qr2wdSOwBaRH5NI5StZsRBmoGHGlkxiDzz5o/csfoCE54SK1XtUmhVRnLZxDcWdKs+9gEPBqp
 3zY9ucoq7jzm3xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1715 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX8UUQvqIwFWFe
 iaC2aJk7XoHC3IUPgAew7NSN5mc6V0as3bL6wWND4KdKgk0AmlM1dowrdnEn5BDZh1JkJYThGLv
 bmu6xRrVKNIEGQv2T9CzLwkWtRhLiSmuct2JWFOeZtgPX9HPfwejvhYN6OIiHidAOtMmjMhD2so
 UOHTEXBrhg5u6lnwXEeqgNMBNPqoqKWPjkWeJNuY/z3RLwWUtAErnPtDM5PRnfxuH5foyj2fjqN
 46pvL3qN5xF4iwfI3DFAGHiuLzGf3duNCdueqbDCnhqT+QeBK1yxOzoLYhQianwX3UFeT8Jsw3D
 Q0N3z4cqK17b4s5cY1k1Pt0GjaACOpIhew7/ohcTtqF3dFfdh7pazU5eDaRczF5u4XzyU/hyTm5
 iDrU4gcHMmX2kI1c2DD2wAh448pELtPoBVColATmgZQ4wjSSJWSdIXWQgXFcg6iWIRQwaE3U2d3
 P+CnDgviAeRvDkrFI8Q==
X-Proofpoint-ORIG-GUID: Jf_2R1fTQ7Ao0kXikc9lBW6s2ZDNBLCd
X-Proofpoint-GUID: Jf_2R1fTQ7Ao0kXikc9lBW6s2ZDNBLCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
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
	TAGGED_FROM(0.00)[bounces-17025-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 7423017362F
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 6c1cfe9ec8accefaa3f95424393953ff3b869ff6..1dac73002220920ab8f954b29fcc809c6451daa0 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2038,28 +2038,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2067,7 +2067,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2075,14 +2075,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2091,13 +2091,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


