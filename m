Return-Path: <linuxppc-dev+bounces-15462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EFD0B228
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 17:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnmxM1YpZz2xpt;
	Sat, 10 Jan 2026 03:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767975111;
	cv=none; b=TAX0hpnLmkwtDuPg4/a6/kJOGw1jvo1GTWc1+Yf7Ou570G02i6ZBehiHeoY4AN5578h/P747eyHYuI0kJ2pN61qC+9w31l1CQzUk7O6oTfN+L/ALoU2CtjUHm8CCvJJmylQWzo9ioHUvLu0rmfmPNsWyudQ+eJ4+4gdISR7CsljdvK4bli8nyGQNNt1aJCILCc60MuwSWFDy+wrTvz3axga2nlh/y49Wphx5sRGnNgltHiJq12U3YjAdCajsrg0CJ7hpv8yjTDr64qniyVXdEvfuBU6ouGBLAsGElnUq0rYlnWJbTGunju68VeOs38Led2AFHpcpNa/VNPbyDJocGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767975111; c=relaxed/relaxed;
	bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClFjcb9l+AggBT9KM8KPnmg+lkb7UGddErgCuHcMjPAY6Dw2eGZRZXucFpY34snR2p7SOaLEHAOwXUlcz9/xSj77qc63D2rw0t8z3aOXAqw+0RU5pvzalT6jbl5jBGviU6I3Tw+G25lEZRPJ6i0DWf1o+fQIcTlnV2nBM7QBpuXY8H6X1O2QvEl3/pNceoVRUWPdJQ5AeqP1GF+MGyZLE4MkweUuO+wfXOdsn4qa/97TtzB8iVAWv6FDKyTPLiaI6YofsIXDkwVH4CgbdQBC6VX5ZLUiavi0AKF6ZX1SwtGZm+eWUWzZ9pvwQazIss5oll1EZuofHkkEDLZNI4Q9GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHHNohgL; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXO8dqwl; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHHNohgL;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXO8dqwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnmxL0btFz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 03:11:49 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jIvM007889
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Jan 2026 16:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=; b=LHHNohgL+h8Dn5BK
	Ux0iUHBCy+yQettxBalskTQBCp9f7oc/8kKry1xzZZAg/e3HaDlMuSC1eH0k2mZv
	NLdHhuDM1ICNanc+q02wF5T1l+Usdnj2MdK6MQcHS/Q6VnnEnRDvaDV6wLA1lldb
	ypeirGKyy1Zqh1J3qSsREe8bJxe+iRebKpO4DmkFW42xoHb2T+QTHt7djRdBeZAh
	IXE7Efyg03dJBZQscswdBQASgMnfVelmSNrC5zcGzHVIOCrAv3T9OzC5IzQ6vcow
	4X/1XN8dGT+CnXNDgHwnRIaTBslEI1RnXfBK8h1plNlHnK+Yg27Rb4uX6AveXiZ7
	cB4S0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqh2pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 16:11:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so1160603285a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767975106; x=1768579906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=NXO8dqwl71G9OO9t/0Ft5gijPuiUVhusLA4S2OZAlJcm7X8Rc4nQFD3ZCjWb+zbLZ7
         WYbpfvhmNHTUHLK4GcZizq7plxJ0+a/HQ1CdMd6gUz6XV/d4cR8f9ZDRmr83GyviTZcW
         6vr6LMeoWowOrKe80mVna1yT5mdLP0yriChVUxbi75aWa2CPUXyZzFdpycDUIe5tfj/K
         OtKx2r4/vkQJn7+pXEx7Ay1Mwci+TaqBH/5GMuP5ugXQbvA0OHHyPNT30Gyj9vo53Xq5
         RUcy0DAh38/Ksf+t1RUlI01qVlsUtFXrcg8RXjX442twdZ//+DU5V7J4sbxt7f3D5yWZ
         A6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975106; x=1768579906;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=eoA8XBjg+V6GbDpHGtNGaDq+dwDolhXFOlBgEpnL58VrmVu+Y7lq4rQyNewRHJfaky
         uMKGbJJT8yju2GSBeA4HrhpfHVFE41esEsUBYKGv96vWO9bUi0oLHrOxkXsgdHus7vEk
         Ryg/rdvn5lS0mBdFqsyTJQCvHMxHopZjuLxTp3imaZy5aX5Jj2e/G2FghOGO2Ix6bpj2
         Mg9bcZlVEnLy8JSgltIpX1bgL1ylMNp4U2m3wF1Uu5gl/8omPxJR5Hm8m4e2WOHzWoQx
         l7g89MVWr0lAmXP00wEN+IzXqgqMqw0U3Q079aMSqC5A+MW2y4qFWJK+s67N8UtCpDPY
         CGIw==
X-Forwarded-Encrypted: i=1; AJvYcCXseUjTo84rPA5zSm4sGfdNE5bsAtwYLy+89m+NlFlwJ6Y4fzNWXzM5xMQ8CsyRd96CaavvGy4ZkUtwMBw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxifSKcBOklOBbeCDPyFjTjsFqhPhMjxSXtYrstGIsv2LRHny3A
	2jqKVRa8xDhljnWhtuO51ZGR5JnM9HDvW0l1GE9tQUGTzWBBwJuebjgEFzal2ZbiBP6//USdETn
	z5etVMSyk84iQEH51xzo4vOH8lJ3BfZ5m9fGpdehk2VHDhV2XMntPGD4vtyVp2D7wyife
X-Gm-Gg: AY/fxX6z4TZfjKpz7fVPVvW+id4y/N3E1uN41ywhs4gb6yVIrVwXS7Qc2Fn05HsZVOK
	NB9KrK4M/1u1eNbmjYNK1nwqvD0PrbNuonrHVpUgUQh5v4xRzEUq0G/6cFmjSUso+rfvhYH7012
	9p59d55XAtS4tPeMtCYaLyJs634GQoKx6hlGkUkphlFq+h68kY4f9T0ifsLGgH/VOI7OB0QLIGs
	4FxYHpjVLUfnzJCx4O8SZSlS2+MugxvJEhGrj4l1xSPcE25/J7QClc6sM7iHcsOGmfnjQ+h1XIO
	Oez7hoNHdlGpr0I+YSDInbtnUQibgZXAhAI813E+0NiIYBPfKswZFTHh8aMViErTlT899aZ8cAe
	Sq0UZm0nkoux7jHYMp7YrI5T1ubBV8RosmTYHHQ==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302265685a.24.1767975106062;
        Fri, 09 Jan 2026 08:11:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy5T1E7jUrBX1bssLpIPnC4OcyFtfkLbBfyt51Wt45hTzCQ0qm3TofJwyMoPJOoK6/cA59Eg==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302260485a.24.1767975105583;
        Fri, 09 Jan 2026 08:11:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d31e7sm1189140466b.42.2026.01.09.08.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:11:44 -0800 (PST)
Message-ID: <09bc1f51-1836-4981-9fec-e3385c61aac6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:11:41 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
 <20260106101733.000059e9@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101733.000059e9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMSBTYWx0ZWRfX7WTQvalx1kw/
 52K39TXZIjmMeZqAjmFJbmVBv9jGQSktyhBngAOhR6D/5MLUAz6pPdJzOYjCKS7Hsh6qvSLmQAk
 aJmrLv7cRyATfvgckZZFHTfltYMw9Q0pptRJRUdQ658YtipzdHmQ7973nrTOsXW9XC4TnzcYmkY
 lYpJehFWmTGIH3uOsx1g/Y+PA4ORzug+3uZxhLjQe0sOoQuMiSVoaOhf/q0X9YwWM2JW81s4Tpc
 NHYpnuRxWcU8Z4/2NVdO14rylKWt5FyvyoyN/ezoB+OUQmR8Uj2bjyGKqsK1mWCPsekl1ybfolJ
 APie/3qt/CYAmZ3BpbRy4NuXNJMop81/mpvg1wPlfAP/tJEsDC9eDgxjI4f7qtHlCYGAxZCYFl9
 Xs82Hz78CapgW/EK9aAloTrPhBV/Q+l8ib7Vr7lqwqx9vVKjm0ji3QwDE6x0dA92x3YFw/CA2U7
 S9gm+0DOmW19Bjw9bCw==
X-Proofpoint-GUID: 3CyH8foHqCH3aoc9EnaQwHYPY54VJ0Fb
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696128c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XFS3ILgPfShOvr1i8A8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3CyH8foHqCH3aoc9EnaQwHYPY54VJ0Fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090121
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06/01/2026 11:17, Jonathan Cameron wrote:
> On Mon, 05 Jan 2026 14:33:44 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> I'd be tempted to make one more tweak in this one to bring
> it inline with the suggestions around not combining scoped cleanups
> with gotos (see the comments in cleanup.h)
> 
> No bug here, just nice to have.
>>
>> ---
>>
>> Depends on the first patch.
>> ---
>>  drivers/cdx/cdx.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
>> index b39af2f1937f..bbde529aaa93 100644
>> --- a/drivers/cdx/cdx.c
>> +++ b/drivers/cdx/cdx.c
>> @@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  {
>>  	struct cdx_controller *cdx;
>>  	struct platform_device *pd;
>> -	struct device_node *np;
>>  	bool val;
>>  
>>  	if (kstrtobool(buf, &val) < 0)
>> @@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  	cdx_unregister_devices(&cdx_bus_type);
>>  
>>  	/* Rescan all the devices */
>> -	for_each_compatible_node(np, NULL, compat_node_name) {
>> +	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
>>  		pd = of_find_device_by_node(np);
>>  		if (!pd) {
>> -			of_node_put(np);
>>  			count = -EINVAL;
>>  			goto unlock;
> break instead.
> Or better yet a follow up patch to use guard() for the mutex allowing a
> direct return here.

Oh yes and it allows to drop that -EINVAL assignment to size_t.

Best regards,
Krzysztof

