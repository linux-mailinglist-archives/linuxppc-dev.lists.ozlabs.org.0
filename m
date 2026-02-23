Return-Path: <linuxppc-dev+bounces-17053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBuPMEhYnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18F177071
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMNz0KKBz3c9j;
	Tue, 24 Feb 2026 00:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853874;
	cv=none; b=Po2zYj8Sv8OlkU//xD35SRSRXvztK9YzCgeEhv3vQZTPbTnGt0dD0rWWyloj1u4veqbe6RUs6AT2Y9emqn3QXvx2qhsEe3RZQEClaqPVqPGA/l7WvklzNCWz5z9aLOykYYSyhbT+qQ+RzykthjXyMopeHqYMgnuMa7mG+cGXY9q9dyX16UUpRSXof14iRRaQ3MsoVfQjg72yrXoh+KxpEHDpHyF0hsCkxGYh1sQm1fFfsxWL2NsMSBUngyPbvp5eo8NLVopbMEkYjZp9uSDs9f5WEdrJ18JxlVRZ3tNLEKmBkEJU2mrSYnx/Hq+WZAhkoKGOpVkV7Tc5GWkcjCH5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853874; c=relaxed/relaxed;
	bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOx9rc6R2WooQZBeQRzXiCvs/ThpT4XkSiXmxgPmk1y5/vEXFbyysKxUOt9L840SQxUc3Yv3Pygw62glAXvWCtxLA1ssL13XH5W02ctGj0v7JMOb6WsDab+jZi0WOPMNuY0qQgh3iMb96UD3G9/jQlBQoKCb4GNRC5MSO5DKif+29Efvu3MtfVJAXUt+ufGmONwReaQsXBLZELKvMjVPSGfih3kwIxUV5aHI6p4BTTFAEvhgB4HxV2GVTTUHYGLcRxwUwKoXJKNrdDbioU5xiDjwZPgO8UNknhCMD1LLrRrfs9DWiZm9XWXnblo4LJ7rw9XZzl1nS73d4bbkHycVbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dYXQH0Mq; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INuVGzRt; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dYXQH0Mq;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INuVGzRt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMNy2M39z3c9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:37:54 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYc5d322200
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=dYXQH0MqntZSpIKl
	cur+MWYG1rIaZsKmNba1FmLfUAKXHNpGFVT+7SP8N7Tr5AlCyvB36GtjALEOK0Od
	ckgnz5RR9O4aFrgY9dG9vbkCWvnORORIkbDI6rQMYjlkJlXEGUAJgrR6C05z+OKI
	s2pN+SWQiFcc6QTY62km53aJJCbrN8W2V/UX3nX7OX+tZTf9xjin8hyGcqx7+M1e
	V9q8/0rgb0cWFYQ9bGW5KfHHCNrbUZHa9sNG92N0hLnZhjUtXpMiJmJdCYIsS/PV
	TbPUsydiR94kgac/pi380Uqn5Dnc2ixobvxW9uOduwCGdexZA+M9ply2XCIV42sJ
	toiboA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb403842b6so4700843485a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853871; x=1772458671; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=INuVGzRtRn+pdoAyJdXf+oODkiZ5xVfSeLrc85vW13UCo4T3EOi2qBYcbUmNfqWKmu
         dbgtDVGXDuFdw42HBIR5jIAz1kg4jmqPFzs4j4UPIieYM5AS0eN6VLsgTNl+ybwUuGUj
         lUTlb+TNCijIc6Lyji1g9qfKGsj3wPmuZRrX3WcY9ioCOhKW7w61M7XDvX/N85Ix1dCG
         kcJESw19LSixAfBE23Gh649RWmyX2jzXR8THHlSwwPPf4UG36mV173hhOt2FoTAaz2N7
         ZXOkWQqEvVXM7eOMmxj4JxpfK+K3VGlKlu+M35/2p//ZACY3V7tYNKlzYjwyH/pnXu2p
         pkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853871; x=1772458671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=g/wHrrVWPzfUzeYcu3Z7JtUQTYAZiDJuDGp/IYmM4KpkoMEz8hVupk6tEnvSXNKswO
         5svse4aUMD7pW8kj15j7OqaL1XHe5yLUwI3j8DjUiGN+8F+i8pBGwhW0uclGsrQa2OmL
         g6nKGYQRUC28lIW9m8PLxIWoFLXlobBHR0xaMrDQ4P8pa85vlWISj4Ba1iQ605Po3fG+
         knXdLKyVia0RIi3lc+jPN0Nlm/jwJxWkx7OMvs9grC871bCnNAWv3UucWBlLyEOcP8UY
         Q4GbubVFgQmYSV7SeoWraD/Q84tLUsNymF4BBQnpm1oiNi0snWBksEJPAglv9wrE8mCl
         GnaA==
X-Forwarded-Encrypted: i=1; AJvYcCXFZcl68XI+EmPcSmGV1xahtoJ7YqUOKv7SbzLDQAGkfOkw5aR7jOvn/FJyD2jJEDoytMwr+ElU45SVpvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnMFbhDQijUrRoGx4ZHMLQ1VvDjiB26eHNqor9YYZe+gS36bNA
	bdQ5FnFLahrSkMwZ3EGq8WLChCeBJtnuDQ0AU6BZigsqHbLda0WU0EQwUoHeu6Jwh3Q4hQowP+B
	EoijqXn/nE6Dfh+1R01uRlWcT5N+eDSxz9R9Wteocc/pscSKDtm8OtEtvwVdU8VIe8bkv
X-Gm-Gg: AZuq6aKOCbiftukHYjz2X2xOhIbZOaxPjzRFdqfHRy4FikvwLP2MUo9YDw9iNwmb+Jg
	J0R9M8p5UjFAy6OQ9n43Pf8nfqULJYULqMdnlJK7jQfvibBiSxqCK2yf0PIpRtzf+OeyJez3prz
	iPt1gUZ32Cv8fyKgnuIkFjIR/VG3LM27JgC+kkZbL5aImrLokGHBX8wECH4m8aDn81ItnHXZC6Q
	AtSLve9L2TDjf42HJ7D1wgiZH8JJPrzka9I5ChV4qQ+HV0uthZCpdEGauD3FqU4/0WU/NN1Ltl3
	rH5q68KHXqV5amImoiZpklahkknIs2Eza6WKo6Oprs40KwXzrYswjQc29YyMQ7/db/Eit4tb34A
	SXwQ/CX0M5mZFFz25eWU15qQsEJhv00NpqWd83TX1ddOOEkWTS0o=
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068241385a.78.1771853871500;
        Mon, 23 Feb 2026 05:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068238385a.78.1771853870980;
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:19 +0100
Subject: [PATCH v2 4/9] base: soc: rename and export
 soc_device_get_machine()
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
Message-Id: <20260223-soc-of-root-v2-4-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgdJ4S3kKQy7E5gZ1HH0U5SQZilqtbHrWuRg
 vsXfy1WCm2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHQAKCRAFnS7L/zaE
 w+ffD/9rAOyhycwaiVuwUk5IsBC6AoWuSyHbtclUsR021hX341sTNrodmTF9hBEyCYtfeoID3s6
 6v54GhA+fRlXWOiMcydGgtSfnh1/l9JMceBWhF24bHQuSAibluRfYEHlf3q7KsT5Hf7u/YfHdwv
 0S7/gjaeJS30/KeoKhxy+4i3Zl33BKt/7NkLDJK4gyrzhOJIecBLTZZbC58VhpbOwBq1uchfsSI
 eM745iLv/Vlg99B9GuBna643AcG2mK0QBRJVBqm0q3ynRf2uJ2T4i6COg66w12blMZcHrZK28k8
 SeC/oWmP91fpkpb0irJ/icN6A6vIIFFenIGT85YwHaTwE3+gvxjb31t1Y5KompcEwLIPOAfn/TL
 dWoMEdcE8krPx2hBK8ylSyyT9+SD1tMG85TZ4OKKbSixYU5XP/Bj6mVeGH9+9pKUqXy3PSuU/An
 V1NP8SeznajicCUQ1QJF93oKppmUIm1V5gQQKKxi1I+gWRG5nG5W0/uTz33jh3tvhXxt14vem2o
 0Y3AZokJjVKI8Il/350KT4+2vWorZeZjVtaku4rZgEEcoxjQ4q8YP+ic+Pt5ExHSIkYiEzhC5jv
 r0utAOUE+xo8SMXpcDj7WmsGu74rh8oim9GPqphG9oWx8OlsUhJ5jecRvSRHBK043p5Arv3iWI2
 hnk/0nakVnNjHYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX3iBVO2fJh4hC
 Fwhcoe0dfWXNFy7X+89TQEBVHlY6hlLRmvZIckHg08sfgBYeHwNTLZN0YtkU43U+lSJx7L5+VY2
 1fJ8n/hj97mkj/rTII77JVaPShxyTSrw+VxlghvZ5tAKRl9YaHoLNjwGFB4MF6asELNCWtPcVDq
 eKiqtkB23RhrBQ+h88lyR9L9cIOhDV3YS0+RkjTwYoIdqntNSwVWZZJseP7AoMd5cVzgzxy3AW/
 fRlN5VqDPSnWa9WQ4N8UwdnWYIFACZm6Hc0tk8p2sQ5xcnzrwYCN61b18PNr/8qXw3IX0QCRmXW
 OjVE8gUoE+dvzQQey+Xvi1uiPJU3M1aHEhLDIM91hgNhkvOtRirBinG43pYzl+Dr8+PEKDlD7pj
 MY8iDKjlegc8835hRI4JnI+4bnSdEY3i6pHYX4ManhzSdU2sm5mCva1FK0+swISmfmTHa/NGKfF
 tAoDyN102x/on5S5hcg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5830 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JiiTyCGY4HM1kSbSebCmrJlKM_vruJcQ
X-Proofpoint-ORIG-GUID: JiiTyCGY4HM1kSbSebCmrJlKM_vruJcQ
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
	TAGGED_FROM(0.00)[bounces-17053-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: DF18F177071
X-Rspamd-Action: no action

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header and rename it to a more descriptive name.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 13 +++++--------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 48e2f0dbd330b8d402135ffa7308f454eb4ab7a5..65ce72d49230360c22a812cb9286e7fb4de0baf2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -111,17 +111,14 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_machine_read_model(&soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
@@ -131,7 +128,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
-	soc_device_get_machine(soc_dev_attr);
+	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..f19f5cec18e28461fef57f22702d2c44a41e4193 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_attr_read_machine - retrieve the machine model and store it in
+ *                         the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3


