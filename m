Return-Path: <linuxppc-dev+bounces-17029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFIWHFwXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179517367E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDf26wLz3cGg;
	Mon, 23 Feb 2026 20:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837218;
	cv=none; b=IxDoFgCfOmYfwLBg5q47uRnGcAuKQoL50A10sbhIPaCzVVvtT/GkmQfYZid6GDmg5kHJ6L4AhQ4ubxJiB2JIRP0QXUw6OHXso/C1K0ijL9PgpEY1IxN626mCM2ljDWi75LEMIIaPiy1M7nILE45dIJLMYJzPfVu8f+GoUdxVHAe8CO4gM35DN1jRvQUG5doee65biqxPkEMB+Un92wNjRN08TA02tqIderzpN5FVryDADWZows5SghPzGTC93HDiLYn5X4cVCY8DbgzGaaKf1GW8C3xWw+eQTe5KIfTUzRJz18mmELIok3d0OIhivTzCJEzw1lWRxC8CzCpJcj7DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837218; c=relaxed/relaxed;
	bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTa0yttTOWYWMISXMQmV746JnJQmqBfanIJABDQ5fx/IWgdvbmrsS2aDLIPwlQfOXzxTB64vnmRUqOqrU1HXdc3K/HC04wuYYX4LeykXAq1haQqXzGKaDweGQT8eIkvh/3jRvCemwoum196nTbUo0/vc+R11gLuAmNHDxjFT1a+i6Wz002CMnWr0ECgrl3HGJMhM/60SayxAvHpMuROL9FxcPh8D7r+M6RLdj2+SwTz/KQdoEqoUYptjvU9K6iJPySYExAPtRrWxWzKZ8q8YcE37dUQ1GBOB7CSXKNBMSfsZFOWoUxujhkbP+2UmZpCpjqRzGDYLHv5OIuTfgMDa6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z31W/9nu; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AY3LcPJJ; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z31W/9nu;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AY3LcPJJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDd3tKXz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:17 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N6UdY11217262
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=Z31W/9nulwQAAZ/y
	ktZPP6LohTfU9u3yekdeRN9Zhw5JTPXndKPMIWP4ZTZPl39CRSKkGmQ24K6wTtVE
	ddvpg8edrCTXMlWpfnSHiRYHxO8cJ9IFoFSsWag9NuJrYQMXuG0MlJ8RXGpLm8j+
	GUGOuqN6cjO8Ly3R2/04h02h+COPxjNLHOM9PZVtKVX1f3Tdh/+7Vr3xra20Wsqn
	eHPAD6B+4p+gFjVPJKeeOp3BxuNhrl5v1qkvfHOMmTtW8iqoyXAEbWpfgxOaNerx
	bxOlU9NumkOl4E7q6mxJvQugmdeQQ7j4YQDpSaLABHgagXr6gLBpSD0kCzxRHHL5
	EE1fiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so4420545185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837213; x=1772442013; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=AY3LcPJJutw9Lji/660C6mH2HOlk2JxeXxWnprDnp/vqLhe8GbFFE5YgIBqGJFs8/7
         NeJijVagB/dqGdVkT2ecMq094q55hQXJRAXpLfQv+P1K17Jcp4AQnA02/v9tfy4UoIn+
         jIjhLIjWqahshiVenYJeotYfzttjGYdovxtqrI0mrvmOW99UNE/IexWJAsAjww0QbKIG
         yKVSmJtSIhmnKPuZQ9lKMkmvGszm4GvzryqS7z3ZwJ2GByrsaj5OXMTwdkauQBR/qdcX
         rkWFtvJ3rvahdQYd8/XNJoYFdI2N8t1P4BLo3anqh2cDoQqSiLSNqW2i/ScJhqE2MIkv
         2F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837213; x=1772442013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=jABNhVLc8d4pNeS74sMG95Nsh5toxon7U3h/9wnTWFqPicCRTaLT8wFyphVWgJFCbg
         Ttu6HstyHcAOwZBcjBoRmWn/iVb01tFqU0ZYNP3tLHeYTvqjrvYZ/9cLBCgMH34YoMrf
         PWOAL3TkO3fyLflTGYrAj6vIx3cMh9kMLwbF+w0xLE5Yo4pn61H4m1tAOYG8m1WIN91x
         XQVWpYhS323eUd61MMCdmE4OXPlVbGDr9AH1kTrotDt+lU5/ExlNd8rx1mljNbvpodXo
         MWn1usryXGJ5hurhWNxckzP8rKsupP74zXwLy77pjbyzcWWUHuezLxfgkYADrnqaDO9z
         Posw==
X-Forwarded-Encrypted: i=1; AJvYcCWvS5CV0wMIlDdkvZrL5dnlMtRQQSq8l9TVGqHsm/NC4ak1jrEphEU6haMQfJ6fLjVpTscPmtvFjIv1gyU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRqE4IEtkqCLZQ0h6YGohs5aOJRvC3lI/LnvdKgywLeoMO+tpX
	7Zhg1cywOuBiRJNeKXOUzlpq0SzYDGFe2xE+Bl16TLWKWuObU1aD/0wRWRmyDzDPZErEoYokdAn
	QCAdj6Uz4Ydx5Uyx5rF2oj06MdD/aqkj+AZrlySexYHEgstANzG+TtKRtxVOmoLLVanxxrTOpXB
	NY
X-Gm-Gg: AZuq6aKZzwrjLoucueA/TxIWdYBm/M+CBVJFXOeLS+emU62pS8PUFJbE9RFjpfQ5vg6
	jakKXIefwWowctcPC/os/923apkOcXf78JVMYfONRTbYZpTB25ISWxLynuR3u3kZ7YimSeLtYdF
	iQdZRyL6XNEnXtjd9JFSgdK3tqy9m5qYX9CJX7t9g/P4dsX7ykBb+S9vAYqMurCY+UDgC85Ab5f
	Kw2gJbZ4rwQeDwMf+e0YVnyT2VcU3QIjEkrjm5OSbN6N9Q80AX6uGj4zP6cOcgnCBB1IOTYG+GA
	xPwtUbRbD34qVyFijSg6QhvRPHUPd+gm5katkdiMvUAcaR9atFNxjuxuwHy4PanCjI0urtluDu9
	lBGT5W2h3Q+oqssqHIEzZuoTt7fu7sj9F1ta0n7RyrNIPrlfUqskU
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893387885a.52.1771837213270;
        Mon, 23 Feb 2026 01:00:13 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893381785a.52.1771837212768;
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:37 +0100
Subject: [PATCH v2 08/13] i2c: ali15x3: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-8-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcEYiK5UQfbNNqKPli3aLyGyc9dDCAApPSVu
 LSNBlM5nICJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBAAKCRAFnS7L/zaE
 w4NbEACQ/tkbIztt7habxCJvYKOkNiHzidkMAis/yUMZwvnw2HpGFGHCIFcmkdnHg0snG26uQ4h
 0M+1oJUA1rCaBIo/sDh+VRpAaMSxZQgwYg3dWej8mpAiT3t+jz1z00zVZ1/DnW0PUH+lh2agaxw
 nvsIfrzaFtUww5SdpThdARVpsR7vCDw4bpz2u1Y9OzPLqqrEewp3+YXh27EsI6WKyDxL0CQsK2Y
 Sb6pdI0qGN0YYYEpZU1xOcnOpfd4Oskb8+Kw7SVj9PlWpfZjKg34Yf7W0RKuf9OLGzjf9UIBDhw
 P8ZhrX1x2eWmWiZnQaUkF6EyhmhxGqbfnp013QQKEMecw/zmvEJds6WY6sYfoFvkgceP3xLxim9
 /jhbVGlEo7jr/FjQs1X0ek88255UcO7PUwflz2vB6zGXoMHjUAg/7QK+H9GE5rZva1whpge1CL6
 DisWCwE0DR4v4MD2gP+Rm4XTJ1ID3W6LjgygBrxIWby8hoO1PYxp4/8hpAjWHuAeDgklOK1VElK
 g2qVJfjeHMCfM1pUgX1wN6je2wLg+vjHdy/noDtTeUBkr1ikXhXpgM21fa/JMFhclnYLx+5JKDm
 BVlk2V0L04Wdt/URrfJ/aSrcxdhtsenJkpzGHNvZuOSKWS7LuTKEVdhDfbFQ3O7JS3EMR8OWiT2
 T5qRX/0rHDZqaVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX1mYSBc/kVoZi
 mxsXkOGUFhTuTV+weBQzKMz07QcBVVso8gZxak32trdCWN2AuC7D3hai8wCiikiZ6dfLfM5eJwR
 GQLHja19dEFX5JpI1jS6QHB6sJoEOwPbFmk2Ay3TBEMkggUjCnU45ZGy+YV7SmTFJoNbzS44Tup
 DO6zb0zhKaiHrjD1PRtvM4xa+iSfcy4r8ne54vzPdDOMb33ZQe9utYLnVR0/fr45mKcI1qkcyr+
 0obLvzGAsVtO859ZeuvMwzI7CHvY6yLUy0maJGmyp6Kht8ct55T+SxEFC5foOuYMzakpm+UWomB
 JnJPz17vUVB7qB2jYbw/7B3eIEnDpRoSYe54U/syUxqcajhAE0T+upoaK1+6fEbzQOt0oEG2P3y
 8InOUCRU2xOfPMpzbE3c238mrJv3jyY+TaxiuHQrPJTwfJJWIdJLHHpp4VNugSeQqfx/6KvO0Yy
 /0snReSCAg9dUhEBPNA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c171e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U82-xNNHWw2YkiZMErTw3mIFaSuwyJTI
X-Proofpoint-ORIG-GUID: U82-xNNHWw2YkiZMErTw3mIFaSuwyJTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
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
	TAGGED_FROM(0.00)[bounces-17029-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8179517367E
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


