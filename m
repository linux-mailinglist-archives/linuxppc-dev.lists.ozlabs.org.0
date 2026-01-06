Return-Path: <linuxppc-dev+bounces-15303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7DCF76E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 10:15:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dllrS68vvz2yY1;
	Tue, 06 Jan 2026 20:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767690936;
	cv=none; b=EBHfxaNYznpZ5SUb5UPgl1aQyVwlBWHTKsiPi31TdZe4zjgwbI91Of8h07DxzlDV+8x4Rd/cfP3YPhe5WYefpV8vB6pK+7TVq768zfsaxj4q0lyy6KvOA5E7UZAMzmIGNr6rBcReis/X4k4JDwVTw8jtfhazghN+mrAkZT20YTcClckGBmfBrnj7Sp146RfByMtyb1sYfu6bUQKM3OU01YADuJwxA0qszhMopv3pZh7dVmJVi7/CHSJSR3NEcp0HBGmW8b+zxIwZe/AgMEasvmi9cymw3+1NxbQ8z9ZBMEWioR1fLsdiEGPgDmqeArt0uax/9zrD80MZrzhOde4YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767690936; c=relaxed/relaxed;
	bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZfmCCBi0ZWXkLiuGqj+XaxBV/V/YJKh43DoomOOKI3pXUEM6VVFDQ+hdautSlCSzafn9AVVBTenaziPn/YAdSWaHlGfvkMTl/UYix2kFFkGzMizNtsWg3c0MUiwLJeBT4prahIhjEAR+9UbQAR2+9hP5uk6rMlGfPDKdRXptqt5hwFW5j91VcsJNZ8fKPFhxbwVxXfsG4InvK151sopOH2yQmyFNwnwck/K9DdMP+XI4vDxDEx1NZYCWYHp6Ak5sp0Iz8uJpFqCahd0j/vx6oxCqW51BAaKmCxbV5qdc2sWHpSNdlGraR/yuRXsiF3gzLldZgT9xMmDyCcWftbScg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyPHtjye; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX748PTA; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyPHtjye;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX748PTA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllrS10Trz2yTH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 20:15:35 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYMv529179
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Jan 2026 09:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=; b=jyPHtjye2eAPhVOc
	PoAK8lUqtWAiT8w8TQfWZiRDQ9pGJxBritSL8tg0Y4L56BTFb6DAMYnIj+86Jnb+
	HOIY/Nmq2E/Mp//T6Ffru9yH654dokV6tl89I1XNdbaSlJw3iklF1VHjrOTKRJMa
	iPtsqn4Zig19W0IQBIok5o17eqI+EmNQCvO5Gd0ch3Zw8Np69pPHirjWHn9SKB+b
	LV3i4wS+J5L1hSd+BRvGIGV99VYDqED7UgA/WApXOhV8Nx4sPT5Dhdk2D8iNy9gO
	aOXJM25hacXO7ZiExwMxxF3FrNzKjNCpSvuka/FOn++kqf/ElGWT96vL1s/5aiZ1
	reVXWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu2j0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:15:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso20957451cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690933; x=1768295733; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=PX748PTAZfHmViossuna9jMTYTQ5X66YrvcW4KTMrWRb70A6z9YzXc+ChGoY5NRqiD
         fYX8z3l/LevSnM9kR+/SZ4b3Fb851/wJf/SpV85E4jF+JrcFEUHENA8LY89pwK23VTAP
         eWDs8nYmKAet2XZH04jNUZXNh32ACR42BB90wHTCq8HIXrm1bPXCYznQ0DlIWz5laHki
         clLANYjBNIzCR6zxgDlEpv0kY7waPIlu0bfzc//SMjddjFjvjtOwZKOK5binIFa2ftNO
         B7Z7EhPkTk4yKuobXjlnTW2ayocKscKe674tWoNv4Uje0LI8qW+tAKiswfn+hihNskWd
         qesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690933; x=1768295733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=iNDt4FnQ7DK1T7qyGsFrCiwZrVlEgk2T3B7N9IUy/l3aa79wGenSOwCdeKMnq84vgq
         ILtE0R65lEjGueJRcT4eNZ29M6AcyWrkB3SofzrWoJRxqdhznV3CYrZWf1Nuj/YYvvnc
         jkZAu19wPWVYlMRKiGyQ8lwjci99vU98nUMcqoTD3TzqrgcCXP+MM90mrftNE8HPJT19
         wqegAel+OxwjONsN0pjINYF6PDJYpOWFd6pesnN6T0Kr4PAjiCxbcEnPABKwLcfhbvP4
         xw0PbrpVkya5DoP1Judbzke6naY+wSMJQ5ZNQOeQl+pSDmYBzi8LGHQUQnzf3s9jCr5a
         vfDg==
X-Forwarded-Encrypted: i=1; AJvYcCXtvFaD3zO+yYhXPfcoJ41OQQCVT7zuefDztmNF2cNl+STokQoPmdzDr4e1KNdmrXLq+ytpvUO7fpig3r4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqX+FQ+Y272ZHZtNPKs6NuIofwTMfCoXt2BEDAQxAyupa2ET5C
	ooVCBvB1KJBHD2cG2tMe12mHdMRwWXokpXP+ox0nO0paN5qWfqwCHUosNjlGT7UxIMPt5K6+ruM
	Ph3YtJEEUH//cnILDZz6/C5PKGH0u0y8WpZNWv61IykT8BtHLflGb7H89LE8FiUkwYzpZ
X-Gm-Gg: AY/fxX5L1AvGVkZQ17kn/qQ1s0IzmGybYGKZNuVT4qZ15qux+Szcunu9E5S9wPXo50e
	ChujD5UoIyg5oizPHVvOb+D3wn2tQQuBK3jHsI1Lvy/R+hSw4/U67F3DJE6F6k2o8Iiz6l6oSQt
	/nvvOJ6WH6R/2SBlYrQY0jdmYhOQnMs0/Ec7D3x8QvTDMkUd4CvJkkZKdX5ihCewDJthkhOoNvS
	m0N0KcXsbY32eqThY1x20Tt073PN9rf2B6TKLjxIR+nzVFc/FCJKEAJ49PkZyRBY9stw7vkzh5T
	Zf3f8TDfETsUWyzfLwZ333U9P9d/ixb+hvDQdqYGbHYpFqHe9BLDQ9eQWQ9ifCJNU581Jji5iVj
	DOLY/kCery4TJraBxtt3e0deT5bqg4m03Iw==
X-Received: by 2002:a05:622a:493:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4ffa76de37emr30150801cf.35.1767690933171;
        Tue, 06 Jan 2026 01:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU3Y8zmw4yDdSsZkO7a8vArQ0g4z9wcGDwN18iKO05ZqGqQu4wJ8DuL7AWHNnJ0SucciF+eA==
X-Received: by 2002:a05:622a:493:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4ffa76de37emr30150331cf.35.1767690932699;
        Tue, 06 Jan 2026 01:15:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:13 +0100
Subject: [PATCH v2 03/11] ARM: exynos: Simplify with scoped for each OF
 child loop
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
Message-Id: <20260106-of-for-each-compatible-scoped-v2-3-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKizhg0XZxRYwya0cdJWbbigmzWMszpBlU0f
 m1rX1SufhSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSogAKCRDBN2bmhouD
 16WcD/9AhTJOymnDzTKEIECQkDIqwNngscSld9son4Qg1SfT0m0VMq9fHgWlbKbWiApl9CN9J2O
 uESLQE2cmOqFiDE97+ECgudVTYu004061lm3PoQgKxNe6wu1KGtTv8b9izPrlHN4H18M/Xfe/TY
 +95V47mm8FsjC03fWPMoad2dNAbSeglSfoITtmenOcTruqyHxZBwKYOuJaxlPvgn+Xl+TX/sdJQ
 CdbXwQj5gkFylKFlDEWfBVfcHEzRm5qCDIffdoH/lQc5vOjbp/18olrjxjwbYktFI/NZLnWB/6S
 IqSluu/rV/AL2/YkfYpOd0jWcd86Emfe7qumv5diaxtoQK8vqz9p/Uwp/0RZhPjE1CIqRUkVIQ3
 LUXb3vYW1b3fYYHQc0XJqe8TdprAvIisJS+sK8IYgEIeZ9r4ob2mFuurqXosFeM7K9kRD0wHSpk
 zJ/Dbo8xhRBSlqGwCHYiuUr5xD+9Xg2hej2sjSQt6xn3PbbNZZZYgCQV5ku3JZCg5jQRrmV6v2Q
 GQejma+7ZAlcvZYyKT+Ia+TC1jngq6hwyaY5JBi0BTXdkjeZRLcUEZfMftZtpreRex8OYwP9LaS
 sM12WcO970a8+frrRnPAZgGCLbeoDkvIPMf2xoJsHBz0QTDIXlZI86HCo+ybqT/sOAI+HFubvgd
 u3+klfTs97qeiQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX9PagzhGrCg5v
 EsLnFHRReakAse6fPcFt+GmPMdzo5fbX15p1OGHza+pVl9PbdRoFoWuXOWIn3AFbcUQTVkjyx2Z
 K0NcEIIsZjoH3Nn13/h2bDovM6qTkKyJTNCTL2eAEYugnBwYDjvdR24vycBz7Z45mFGbGQ/CG1B
 6FWgn+tj5ceoewMWEwldoVIvoRJTbkopa6SO6c7JSVJMP/ezbqkTDNoi0sEBn+BbKZsfkqXuVXN
 mCqLH1tev7RJfYcDZG002A1uSfweVSZbMoz+ldAdf7NS3AEQRyJ+kfHK70NYr7jeu3AuXwHWzHk
 g5CJFUG79+ApbS29fHy/5eJOELJpe/TZTcUMQ4WO+6+6tjR02DfTKgb46COAB3pQxdRQY9wmVkB
 2XniY1LjNtZVEYQrPFsTpVXP7us5U0e6YihHwk4eX6G73gG3Bqmjh+vQiV8wMtkvci6+GsWBvLL
 ng8NArT0VricF7sWDUA==
X-Proofpoint-ORIG-GUID: 7wrZS0Z47ToG3XDeJWfscQSxUQ5jURNd
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695cd2b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7wrZS0Z47ToG3XDeJWfscQSxUQ5jURNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0


