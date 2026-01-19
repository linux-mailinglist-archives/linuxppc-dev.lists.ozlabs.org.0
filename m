Return-Path: <linuxppc-dev+bounces-15963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE7D3A553
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:40:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6Z0c57z30M6;
	Mon, 19 Jan 2026 21:40:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819237;
	cv=none; b=bSCIkITLS2lfQ8pUh646AOdQhazjnUAfZNAoyhEWOwLmELBhVbns9YlXNms5iQYEre0qkacPjJavtkPdVLDb2QZ8DE+aYbwvWc80PIgZyZjoSNA+K2y2XBA7EPaW0HLUhURPS0tii3L+565xzfmOhmvOL8gLY0mYQMjCDrn8YotKd0iiw4aoLCW1V1/iR4yhfTweYSAhF3N6FRyt3rf/0r0LmR+6fRSFd+EdMbQw+0w4fEuGamO4mg3WM6AHlDgyEwd5qfZj6Igncv7HtWqkRfBpQtFuvZUOYgpYwYPxaF/JFcLTfxtXNxgz0b+gQT44q41axm6lTXyqKK77YZ4h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819237; c=relaxed/relaxed;
	bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1JwzPmRcLw5pxZqRzCfaVG9Difh5N/L/lohT6NbrtnRQBqwehweVJgdUorpYBEmx7C3gEBgJXfvm/isrF8prR4eEVz6HNEb1/czCJqtAz7zgWF+zciQheDwNzvbPOyyZaYO16jlpUTrBMjMwCwIQYpG7y7DxqaIHtObQk4YosPg1DchgeSzYb9KEUhJHkKzrBjm1aw/mTA0SBgNBnTGWClB/D1qFpMSkmrsnwsBfl121ppzTfKuQsto7K7AtPbdw2Gv9/JpHfcQj7C7PbRBCTzLUevi7BoTUd8epGP4jmtKbZChJDOPOG3mjkB/T8I0OIDOD5KeBdeI8Y+m1yX5ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmtXdM1L; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIpGNGsL; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmtXdM1L;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIpGNGsL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6X5dlpz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:36 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91EgZ1150128
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=nmtXdM1LuG33ut1P
	Lm7V2f7hk5I3fLWZx2Ma8lcDJ7ZCrv9FdZ2ITnRIwFZ69CBPrK8bR+9cjP4R9Bs7
	bufPn7Yp34AFajEbibFCHuZrxmHrVWMmetjBgVxqp5B4gzuTIbZBAmjc0PnLram/
	Ce6P2kmISeTh741nUsPDtiv8x5EAdONn7emQ5zwDvgzCCrDP7+HHN+lhx46JmOM+
	NLP2MQiy4QX7OB+ycHeaGn8hhKGe6AgKf9UydQ3PaM4zuyl5/kKOshVGJyMmTbxv
	fgKA/y5gjTZ5eV6RiYcjyiVvo8C4yICIccyZocLYI+R1c3XdWbUZ/LSiCoB1NOM5
	WFgkfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e544g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c277fe676eso1099329285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819234; x=1769424034; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=hIpGNGsL6c0QQwDSlQhvmCO0AR7Kt9UeJN7AjxnS9s8/cmV4wV0762rfHq7Jm1scP4
         8BilTPEm2l2+RW6Cgg9ZdDGKNA+Rji0X4SvHujQLLOQvqvi20C4vluIJMfRlZVeVtWDa
         DoY9OXLhp8a8aFm3tqFCHHYfXMGdF0dF7OcroQfuET+M2xA2wtYPfk+6JCV0FhnUXxZD
         n31TrldxgPjqCiASwy3m8AcQvvxXroexlidbXdvynDV56ejAC3563eS2JQ9S43zaG8mV
         xnrI6hsalEez4ptJSOW+tX8KbQDC0MFUk6YI5qoBCnO/GVh8RCnS5uF550ARmN1fZKnw
         CJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819234; x=1769424034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=vloi0kjhCEbqzDb+pOZswjY/sUOvOz9jMOZAcIlxueM2zIzCjYpeXGn0pIEL5gv4Yo
         5RqAv2I6Pbt7/mWeoPGfZEYHPXyARRa/lIngznWbE9o0jw1TXJdzOF44x1NNiV41JCcn
         uMKnd2YG0wprzNVMkuCJSJn+dz95gqYbodfEfhrXgp1m+ojWRySGIxiBwu3xZWUhAIkH
         1UFyypVdnegALuxyKgfLy9RB8vYC4mmwnC6INlnENPi4MuDP9lHax9u6ecjomjHCXoEE
         PA9ViMYmBN3bTvUvEdqpXkPH1JaW9ipFRhcNg8OG//t1orgc9/sKsWwoEf5WmOqZODYX
         C9UA==
X-Forwarded-Encrypted: i=1; AJvYcCXEjZMupgtYlgaE3BMq3TlmVs6lMH4pf6oQS9ZkZczbZQ/arczsK3brtWlFXJPPOQkfKsqj63d1CVvqdWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2/R27Yq1raeYZwFfwcyb4TVYYvPbsW1FQdBTQAFHswTHBy5o2
	ytyphaFcvVl0CCYn2XrryzeAz6idny8UAc0IHxZITHD7rQ6ByD9opMCHExaNzLLbUEqK9dJ+SJk
	oE8Dftem7ncMFv79I/KCUAzjlovMp4RYaPrBMcVscvo5nWNl1bQN+w5QOC4UkSzWqXqfT
X-Gm-Gg: AY/fxX7fuRKiJxgQLTBRfPFQyn+tyYLdRJ8oiDK7pLCGlHk2IWovYqG/yNqIS9G9CEO
	TWrxO5EmVzgVTuD676ZxZFISNlC/dbqAzx2M2tHBHYTIjg2J8m5ADYTOBYYsxf28g9Da/0kjBUG
	8++nPbJThO8uy+b9gxeHbCaQukpFR1fg8qjMvxlMk/Ecy/8N8S1AStGa+PdXL4xVbDGHy2EM3pu
	hROvRibnNg2sUHkeDnHAT7fgufAEaZKbkulRXPIOCOMyoTyW5xJmH9I1T+1MkqbcehVwEkxev16
	/Q7KosJfv89773LqX3RV8ZMcLt1NMUvAP6TlaJsNleGAFCHicwc7Pbp83ACpAHMeViHowtyhvda
	2onn6aAeqQiWmDPXTHcJ2z/jt7hwZZs739V70jyjH
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419194385a.2.1768819233620;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419192085a.2.1768819233098;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:12 +0100
Subject: [PATCH 1/8] of: provide of_machine_get_compatible()
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
Message-Id: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoV9sfuT2VvhKGZTGz6p/Fpn/MdjF0ME6wrx
 zPiggHM5viJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFQAKCRAFnS7L/zaE
 w7fqD/9JerKCgcU3vWvfo1Hz4H9oZ1Phw/+RcPbdyt6LAUfl+9qyGpxqNKxeCeC13AqyqLCFTU9
 vtgZoPGxKFtxYTTB303D8vGvNtcm15aQQnQZ5qQsCTwshMpaxqWTaW0MIBH7rF4bFIuU/hu2k3H
 km9rXyr2ze7sMGjL2ZdAZbWdq7h4a7rKUOUhB42EBoY/g5t+2Nf0cGItt36Y9VKxVsUrEW1gcTb
 2q74U3LKt5IiGzLIdSosJxMYiLQL/5RPBdgkpB4CgpAhTeeCsJ6MzEz6o+3+svQCIxmIf37+OP4
 eItXkBJF/sBodLXDhni8ooEdyhdEmn2TXQaSKwq8udjKlU02e4DJa6veW6Lh3rgLkksL1E/D1au
 Eb8kDWbD13muh/brJ7zVB8uJD25VlpKrIAFoth/coR3lWabcgaICEXy1M+mPho6+NFfieRKNSkm
 QDLzesgb9UYAXcIDXJ3CaqzVZwimwNqDf/lHjrY9oBr68CdUz9p9Tgeb4O5GWheVuJ1mWY69iIp
 sdeRdFuVq+TjtnzDhJpHq+lFX5Zyi7nQwcJV3R/Ee0FmJA0BIn5iFt5DzBRvHmXjUMG3DJTVlbl
 zPo4PHcd/kCpPn5NV81nI1LKkb0ewtXTDhTXxVyOwZQe6VDeANWOXTxYLGU09Vcap5BSadE2NZv
 UBogRnzIuUXIxSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PolkbJsynZ_iw5VFs6kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX2pCLtqxB85Z8
 9m9lE8dqInrfZWBx4Wb08/ZYn5iWpS8x7jDQTRTc9ov54bOgSDsFP+MHkaaIL0zfebnTMIeSTtN
 Zc8d7OoK9Sy15CFds/zVo8B1kZYTc4BQpNerpiPH6daS6W7+nf0Ke4vVqEe0GTAb1QQxaJtyQXG
 x6Auk0GchiziKjtHihkjHKg38h+7PhMcM5iZWy7/2FiYmNTkz2sdMDgIPdMir0t455WASQoHeTz
 W/KobFUVYLW7/bNQpSpMniA6Fey9UuQMlJufL/fTaBK1ty/M1Df/WSN1/LSHWarg+0YO1Nfrg7k
 w+KKbotPZEKm5lL1rBo/YmL0cv/0OnE3/k3YeRN447W/DXH/VP7gWNgogpocRHx91V8QfeauwyI
 1D5+RlfEStdb1bee1iy2WSswnuPBTPG8/5ORsYXYwx4dHbaWiMMnzsYU43pj9KTMTAEEi/el1Ph
 +oXUai3MU1sr3fjuWeQ==
X-Proofpoint-GUID: M6kHh8xswmcavr0I0Z18QYbgLhmYT0YZ
X-Proofpoint-ORIG-GUID: M6kHh8xswmcavr0I0Z18QYbgLhmYT0YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_get_compatible - Get the compatible string of this machine
+ * @compatible: address at which the compatible string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_get_compatible(const char **compatible)
+{
+	return of_property_read_string(of_root, "compatible", compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_get_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_get_compatible(const char **compatible);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);

-- 
2.47.3


