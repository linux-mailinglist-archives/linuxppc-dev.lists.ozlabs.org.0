Return-Path: <linuxppc-dev+bounces-17057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPWsIGZYnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2781770BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMP86RChz3cGf;
	Tue, 24 Feb 2026 00:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853884;
	cv=none; b=ejBYYyyCCoLY74crb2SQvfqfaf410l6OYAI6lYgLhMczSaqxFsU5+mm3o0teP2EIaW+FCotdWM7PTi9ChDIcNxK4RYCaGMuxMDqsEv4Q7OYk1qiy1vMgr+6hs77laLuloJLCqhXmI5PPROYtC29vSkMpn54ThMsJ6chyMm2POfsLJu/WAPyFVZQz+HsV8t07DewWRHrGm/qVjdhF5j7G3eg80yTHPW6+lCGhfelDGHf/QrVmadrF7ZrCj/2iAFe62zaqGD3a8tSV0dMcP+4DH+aeF05OMwQ1qLu4MUlF7bMcgsOtz81Sl3zMV4qyIQSgKuwJw2oATA530kKC8TeVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853884; c=relaxed/relaxed;
	bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNixiJGQlfmcX/OVcheDEKqTKsT06P0vX46cERUZhSfmiqKRb9CGin5Ouwr+IDWipmxoGz4nNxOXpYmdY9ctV07zZuFVXL+uJzkx+omFTsdWe59MUS01bDBQ9Gf4/unDt72fcNckCLx6+XItGhHvIt73ZveUoXbHiyHpHvm2FfhPImgnv+vUJ6jcmVcN54Cyj9Tbtbn+o8qxBTK5jGeXqk5j7v135MNdc+LUwQVuUZmo0zUIWeJg9umuMOAX83stmIqYiPW19T8H4+Vz6s5kvRQbJa427Q/JyE3vnSfeWhiE1SfWDzfKH8J78Xb6srfIfmNDW5yKBB474Lt0ydKCRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcPCbrpS; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQRQDZMG; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcPCbrpS;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQRQDZMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMP81Cjzz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:38:03 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9RGmm3337870
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=; b=LcPCbrpSbRKCIqwN
	9+BLAYNwVHfItZHCbpfdNEb6/duhQGxQ2YYNCDN5J1RJXbduZLRFHYL9xZg+8PyV
	kQMsmjEI/il+4xxv3DisCyESeuiMQBtC2Ak7tHKN5hIAKII2ZrlT/KRdY6aE1lHo
	0uadnjIE45fUbkVxMF27KLjmiLR33YjGhmlAUpZBCN5HBtrEn7rddow52Hr7ElD8
	2HYcj9LTPeKB2iIkme6gSl9kmPJgEhxKZUiEmGqZlG5fRB4D0nQjQWc7SBoHZsb2
	lLZa1q7uxaaGLComc3rjBscS0BzK6/TJkP5uQDQ3C4oBPHdSWm3tVg42iRKlRuk+
	DhNBCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8mtga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:38:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so3884248585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853881; x=1772458681; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=cQRQDZMGSAdOcx3oYvlENXiyWkqkA9nADNbtI7QR+TzWEwBdq5EKnrrEtlWY2B0bG/
         r1zTSZsV43Dprdaoa2kqipRp6RM5iK5kVwsuEkkdzjOZVRlalYh+nehP/+wMMb+fpqvD
         7V63hKZs7uDIX5R6y186WEQxpwwb5wZ5kuqpzMYU1SY/FbZk5BprBmlIn9prpyDa2Nyt
         ONgtegEVkohI48VnZuF/2CRgc6CzQFZQF2NSHjYvmCewYx9NJwGiAHtjFv++YKbLtO+i
         cRHb4PJFZky4YzQ3U8+vgma105+4LXFYAenbYyZJKCw1TYKXQk/m02EJLaUDxR4dwLXJ
         42vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853881; x=1772458681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=Jl1oyyM8jozvEmDZN4SYi9hyPKS3jsJvrWqwjP5eJjlPOb4CS2eT/TXAkby5VXxXX/
         bWVm9wfYkiw/3qf/iBl+J/K6+FZ7JRHivPSah/QesCtLfSL1hWUAn/SLQGv4i3zScuUl
         lTka24NgM+F8p/JwDg3bGmkhZSiIykAP7qOgUcAu9gKSZBum70tQeo1tDyV2Lvuf7Nqd
         3gXx52VnWqtniO0fJV/4wdKESIGV0032npL8Rw6ON4+YGvDPQpzGdD1izqFZTp94yS7d
         92AaQdUgl254q6C+PsFDgtIydq1fZ66nxnr98j0Qu7GN0iAT09Yosu1q3rFs8XSF9c5m
         poSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Jym+/H1jRE6OJNlSUGvKr+MWTYcV+SMErgcW+u6sYuNizumzhruIKlrfiALcRzTqKlWtZk1NkcYH/O4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwoFjoP9vsOf8hY2flEiS4nYPyFIIu9DCOjVXuzgkswR2dM+d7
	OsDm964Y/nqOOYgRUIChY12DQzHXS/rDCWqZI1UimE8yD7h2KOm/yZ3EmB2LUviW7QehcfHl0iN
	JKI8uCjDBi6Rg+0A0LRfQmDlUNX+BsWjLE8JVnQVRZ/YH8k0aTRZBC8n7R8AxlNcaq+t9
X-Gm-Gg: AZuq6aIdk4gYXsdD6qRejjs4u1ring6oF6lv29GEWNaU0TDLsfGkp5oAkOCLdpxpWqy
	rTKvJGbh97FWMPA1L4y1CPYkVxHToR/ZrrMEwzHp9xGZX36ud5a2bOptXdNW4WSZDfIPSvmHmka
	/LlL12953JNVtvcQwhNd5BHz31JiqVUyzfvW4CnE1X4wHaF9Xhr0K8hmSDabEA9fFhTTIPwQix6
	sO6sB7u8Q7kPwhTEtC4r1IL/5XvcA0+X/tB6JM6KOBauxzcEktnnNptCCn2gpaKGBz0FjXBv6sh
	yJbZpdRfXYtxswEnLsHQdfa84o8IHNZEq98hKJv+/Yt67Efv18kS5RpqqzRyjWTkF06zrn/Bxf9
	N4F29sAkD+6xc8XNJjWrQxiG/2+h+fCtCGSXFa6opHYZLa9EGLlc=
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864841685a.56.1771853881078;
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864835485a.56.1771853880417;
        Mon, 23 Feb 2026 05:38:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:23 +0100
Subject: [PATCH v2 8/9] soc: renesas: don't access of_root directly
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
Message-Id: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFghOtq7j/iaDL1WAiPG/QAsHsRBHvV9a3nbj
 G82aE3Fd0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIQAKCRAFnS7L/zaE
 w3ZAEACq76nSv0Z8rSsnvGgmS5/mwpaIREv1PRZlCvVtRhoMKRBufC96Leq9sX5QOvd7hTA4xeB
 WMBn4CRDV8eO7tmNxBUe6TA3bRZwlZGt50fLOQ/x0euytqiolWTednJw9IUH0kbKEhqH3EIpi+2
 gpmgUmMsKkfOFVy3NgtrzdSf/VGpaQQFG33HplYR/ulRhVxY8WIrPe6Aub2FrESs/ostBms1XwF
 jWW4trZ6JRLpYP6rYxHoFg9e7BBbrbHgHnN7HevKXTlG0gqamvekyLeCVQTGueIB265F6p+Iuv0
 TH40PbIdWRK15RqpOKKn+LP7GUy+H0zwPxweyJbMloeXmP1NN1A0tcEQplBHAROaLbjgAHLtZwr
 GdS8OA83zzoPCG+E02zTIAsC4IoN7lOyEm+9ych8d8yrms/dRFYSq4Bx/7amt8tvEvCb6q9modd
 Dm/7N5K1m+gQx+XuqXBeSV4tLpHT1dek9h76Cv5QmAdqK+j6ODcDsLWPukVAYlelvk4QrN6ZXr0
 c0VCHVAZbDI4bl3m1jpvyH8qKa1u19BV4M258yoP324LUlv4MCXh2B87jQt5K3etJbPOVj5v4Nm
 Aea7iEMtxHyRgaAnIMNS5r70A/i/XphbgNOa5UZ3EYdQxIcWG4MOL8227hqj1DnvymIz0K2rUhk
 5ESczUqqojWKsMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: jn_-KCA6zNwYKj8KTlyESR-53n-AcKso
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c5839 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jn_-KCA6zNwYKj8KTlyESR-53n-AcKso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX0DEp+K8y7I2d
 /HyDaFAlpCSS/JFcBuBmz73tUd6vBWXZtXqCStaxvfvZGnZOdTyQaGsLCRmPLUtZ34mXzLjr8qX
 uMlwT0B4sUs/LjamVBGxJGq/CjilA7VJj4Vg5tQLsPJ4yO5mjlqqMX+lucEusetvKTa5R/YXIi+
 1Yjmy9LBUXBUYt3AMmz3cRyYs097C5nYzCxjlFmCQi0MCCak4bqn8lWzG2OJM3UsqH81dSu884b
 7pPpSjCiAvwXa/xmnmNOFVu48T5diDQ3vuLw5fCftKyrLfJoBN5zmEGk2Zk29yxolGem0uVOi2B
 Re2FDYa8mRQ2mDSyBGmTCDvjoJ6oM9LPBflsn+blpDRoFbhTpXTIPNSOk/I/ViIADXDG2KZ+15B
 w4sIIKd8ivOilyctWpt9o4XfZslHLFcfNQ+mWHU781okyydMCUqnDMiRCzSnaul03mFvlIEacK6
 oFyQB8HJaVqsQRQyisQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
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
	TAGGED_FROM(0.00)[bounces-17057-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8C2781770BF
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3


