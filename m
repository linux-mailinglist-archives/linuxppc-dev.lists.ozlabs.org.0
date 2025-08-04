Return-Path: <linuxppc-dev+bounces-10567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94BB1A027
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 13:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwYcG2tDFz30gC;
	Mon,  4 Aug 2025 21:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754305502;
	cv=none; b=auFBRneOh7FTErCjSjx7kVyQNkzUJ8xMnPK26ljRRFSFk0+375bVmo0VBdiwQmkA9CbS66a9tIi1z7ak94VOu9hxmp/zjZHPiUsNf9EwLj/3sKnqO5KMJJ770/Xvwkl6zrYC5KM6MFJRdeyYa36SiqAxcro7mmRI0Y/VihtmTefVAiR2mc8zt8GAaOcJIkQDDUT0fJieD9tH2vm+guNhCcnLsY7NNntepslPrmDU1Y9AZM97P8rl4ptHe7oxvNATNBGjqXe0X4nHwTT08wCZWMTG5wkzCGHIO4/AErfYIHndI4yWk4zN1DOl5H2S5qQGpkPOaEL9Pw5Y1Sn/Vi4IIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754305502; c=relaxed/relaxed;
	bh=35qq+K7fBnVu3duIpnhRbj3i361bevzkWP73LNGKLMU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOxP7eBifxTw15CYdaFe4tuawd3fZmYpc87A+2hadpjAFEdrphYx/N1peC8RGUUr8hp3HH/UN7NC2T9VU/1N19J9KvYlXaPrOQoTuOVdcfzpKOeqeAuTmuz9QW1SOU8UKvefCD/X+I78wrM2j0no16MTgGbn7yswr4UWLKe+RTU/12j3Tr7EPnu6gT4wY6QcCKAQIp2c9pYKWwz9sET2P3HdWXmLZHlcWFfOBbQjKwHyFixC1XO2Z/Z+ZXsWFv0mC1ac4jE+2Dw8HzGWdgg7FeFGlLT2k8S8Wf5uvXqJLqRDySbUwQHu9AYnZWX52Xgfig3+KLhOJFx04xeQo7HFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JV/SgZCZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JV/SgZCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwYcF0nXdz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 21:05:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Aakba022730;
	Mon, 4 Aug 2025 11:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=35qq+K
	7fBnVu3duIpnhRbj3i361bevzkWP73LNGKLMU=; b=JV/SgZCZSynbvcweiLXOi7
	3DzdE3p/27agC1iuRYcVLZ4uFbmao+9SQgk0VpnIZU1PaG6cO1lgqh8hXnEdjlJT
	aOA+bDoTLQ1L0XRyV/8tpfa7CcM9vE8o5hWs1hY7VhvGia8CwEvJ5lJtwRoUZ+gO
	SLrVEdFcAnwnQxejkjyiOg6y1o83+bmFSjVUP7rEZT67Il7liTgRD4timpQAnyKg
	egwlBcKt7hZp0FwzpZ/qpGtIcYPhexyuI8kHk3RCNKn6SAyHif3r88UfD5vBi6Lm
	KZlStTXeXBjejuY6OA6/5IL5UHPQDfh9tdsYGCZuLErVWbrenpfbNkg8PvOCp5nA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3gh6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 11:04:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 574B1tWo030216;
	Mon, 4 Aug 2025 11:04:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3gh6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 11:04:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 574AEoJ8009563;
	Mon, 4 Aug 2025 11:04:52 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 489x0nwgjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 11:04:52 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 574B4pfU9503562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Aug 2025 11:04:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 841C05814B;
	Mon,  4 Aug 2025 11:04:51 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B3055814E;
	Mon,  4 Aug 2025 11:04:48 +0000 (GMT)
Received: from [9.87.134.79] (unknown [9.87.134.79])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Aug 2025 11:04:48 +0000 (GMT)
Message-ID: <3e356ac60da0c9b9a3b54e7ebbea404f72f2b7a3.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] PCI/AER: Fix missing uevent on recovery when a
 reset is requested
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar	
 <mahesh@linux.ibm.com>,
        Linas Vepstas <linasvepstas@gmail.com>,
        Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan
 Sadhasivam <mani@kernel.org>,
        Gerald Schaefer	
 <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger	 <borntraeger@linux.ibm.com>,
        Sven Schnelle
 <svens@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Matthew
 Rosato <mjrosato@linux.ibm.com>,
        "Oliver O'Halloran"	 <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Keith Busch	 <kbusch@kernel.org>
Date: Mon, 04 Aug 2025 13:04:47 +0200
In-Reply-To: <aItpKIhYr0T8jf7A@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
	 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
	 <aIp6LiKJor9KLVpv@wunner.de> <aIp_Z9IdwSjMtDho@wunner.de>
	 <aItpKIhYr0T8jf7A@wunner.de>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mQINBGHm3M8BEAC+MIQkfoPIAKdjjk84OSQ8erd2OICj98+GdhMQpIjHXn/RJdCZLa58k
 /ay5x0xIHkWzx1JJOm4Lki7WEzRbYDexQEJP0xUia0U+4Yg7PJL4Dg/W4Ho28dRBROoJjgJSLSHwc
 3/1pjpNlSaX/qg3ZM8+/EiSGc7uEPklLYu3gRGxcWV/944HdUyLcnjrZwCn2+gg9ncVJjsimS0ro/
 2wU2RPE4ju6NMBn5Go26sAj1owdYQQv9t0d71CmZS9Bh+2+cLjC7HvyTHKFxVGOznUL+j1a45VrVS
 XQ+nhTVjvgvXR84z10bOvLiwxJZ/00pwNi7uCdSYnZFLQ4S/JGMs4lhOiCGJhJ/9FR7JVw/1t1G9a
 UlqVp23AXwzbcoV2fxyE/CsVpHcyOWGDahGLcH7QeitN6cjltf9ymw2spBzpRnfFn80nVxgSYVG1d
 w75ksBAuQ/3e+oTQk4GAa2ShoNVsvR9GYn7rnsDN5pVILDhdPO3J2PGIXa5ipQnvwb3EHvPXyzakY
 tK50fBUPKk3XnkRwRYEbbPEB7YT+ccF/HioCryqDPWUivXF8qf6Jw5T1mhwukUV1i+QyJzJxGPh19
 /N2/GK7/yS5wrt0Lwxzevc5g+jX8RyjzywOZGHTVu9KIQiG8Pqx33UxZvykjaqTMjo7kaAdGEkrHZ
 dVHqoPZwhCsgQARAQABtChOaWtsYXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+iQ
 JXBBMBCABBAhsBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAhkBFiEEnbAAstJ1IDCl9y3cr+Q/Fej
 CYJAFAmesutgFCQenEYkACgkQr+Q/FejCYJDIzA//W5h3t+anRaztihE8ID1c6ifS7lNUtXr0wEKx
 Qm6EpDQKqFNP+n3R4A5w4gFqKv2JpYQ6UJAAlaXIRTeT/9XdqxQlHlA20QWI7yrJmoYaF74ZI9s/C
 8aAxEzQZ64NjHrmrZ/N9q8JCTlyhk5ZEV1Py12I2UH7moLFgBFZsPlPWAjK2NO/ns5UJREAJ04pR9
 XQFSBm55gsqkPp028cdoFUD+IajGtW7jMIsx/AZfYMZAd30LfmSIpaPAi9EzgxWz5habO1ZM2++9e
 W6tSJ7KHO0ZkWkwLKicrqpPvA928eNPxYtjkLB2XipdVltw5ydH9SLq0Oftsc4+wDR8TqhmaUi8qD
 Fa2I/0NGwIF8hjwSZXtgJQqOTdQA5/6voIPheQIi0NBfUr0MwboUIVZp7Nm3w0QF9SSyTISrYJH6X
 qLp17NwnGQ9KJSlDYCMCBJ+JGVmlcMqzosnLli6JszAcRmZ1+sd/f/k47Fxy1i6o14z9Aexhq/UgI
 5InZ4NUYhf5pWflV41KNupkS281NhBEpChoukw25iZk0AsrukpJ74x69MJQQO+/7PpMXFkt0Pexds
 XQrtsXYxLDQk8mgjlgsvWl0xlk7k7rddN1+O/alcv0yBOdvlruirtnxDhbjBqYNl8PCbfVwJZnyQ4
 SAX2S9XiGeNtWfZ5s2qGReyAcd2nBna0KU5pa2xhcyBTY2huZWxsZSA8bmlrbGFzLnNjaG5lbGxlQ
 GlibS5jb20+iQJUBBMBCAA+AhsBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEnbAAstJ1IDCl9y
 3cr+Q/FejCYJAFAmesuuEFCQenEYkACgkQr+Q/FejCYJCosA/9GCtbN8lLQkW71n/CHR58BAA5ct1
 KRYiZNPnNNAiAzjvSb0ezuRVt9H0bk/tnj6pPj0zdyU2bUj9Ok3lgocWhsF2WieWbG4dox5/L1K28
 qRf3p+vdPfu7fKkA1yLE5GXffYG3OJnqR7OZmxTnoutj81u/tXO95JBuCSJn5oc5xMQvUUFzLQSbh
 prIWxcnzQa8AHJ+7nAbSiIft/+64EyEhFqncksmzI5jiJ5edABiriV7bcNkK2d8KviUPWKQzVlQ3p
 LjRJcJJHUAFzsZlrsgsXyZLztAM7HpIA44yo+AVVmcOlmgPMUy+A9n+0GTAf9W3y36JYjTS+ZcfHU
 KP+y1TRGRzPrFgDKWXtsl1N7sR4tRXrEuNhbsCJJMvcFgHsfni/f4pilabXO1c5Pf8fiXndCz04V8
 ngKuz0aG4EdLQGwZ2MFnZdyf3QbG3vjvx7XDlrdzH0wUgExhd2fHQ2EegnNS4gNHjq82uLPU0hfcr
 obuI1D74nV0BPDtr7PKd2ryb3JgjUHKRKwok6IvlF2ZHMMXDxYoEvWlDpM1Y7g81NcKoY0BQ3ClXi
 a7vCaqAAuyD0zeFVGcWkfvxYKGqpj8qaI/mA8G5iRMTWUUUROy7rKJp/y2ioINrCul4NUJUujfx4k
 7wFU11/YNAzRhQG4MwoO5e+VY66XnAd+XPyBIlvy0K05pa2xhcyBTY2huZWxsZSA8bmlrbGFzLnNj
 aG5lbGxlQGdtYWlsLmNvbT6JAlQEEwEIAD4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSds
 ACy0nUgMKX3Ldyv5D8V6MJgkAUCZ6y64QUJB6cRiQAKCRCv5D8V6MJgkEr/D/9iaYSYYwlmTJELv+
 +EjsIxXtneKYpjXEgNnPwpKEXNIpuU/9dcVDcJ10MfvWBPi3sFbIzO9ETIRyZSgrjQxCGSIhlbom4
 D8jVzTA698tl9id0FJKAi6T0AnBF7CxyqofPUzAEMSj9ynEJI/Qu8pHWkVp97FdJcbsho6HNMthBl
 +Qgj9l7/Gm1UW3ZPvGYgU75uB/mkaYtEv0vYrSZ+7fC2Sr/O5SM2SrNk+uInnkMBahVzCHcoAI+6O
 Enbag+hHIeFbqVuUJquziiB/J4Z2yT/3Ps/xrWAvDvDgdAEr7Kn697LLMRWBhGbdsxdHZ4ReAhc8M
 8DOcSWX7UwjzUYq7pFFil1KPhIkHctpHj2Wvdnt+u1F9fN4e3C6lckUGfTVd7faZ2uDoCCkJAgpWR
 10V1Q1Cgl09VVaoi6LcGFPnLZfmPrGYiDhM4gyDDQJvTmkB+eMEH8u8V1X30nCFP2dVvOpevmV5Uk
 onTsTwIuiAkoTNW4+lRCFfJskuTOQqz1F8xVae8KaLrUt2524anQ9x0fauJkl3XdsVcNt2wYTAQ/V
 nKUNgSuQozzfXLf+cOEbV+FBso/1qtXNdmAuHe76ptwjEfBhfg8L+9gMUthoCR94V0y2+GEzR5nlD
 5kfu8ivV/gZvij+Xq3KijIxnOF6pd0QzliKadaFNgGw4FoUeZo0rQhTmlrbGFzIFNjaG5lbGxlIDx
 uaWtzQGtlcm5lbC5vcmc+iQJUBBMBCAA+AhsBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEnbAA
 stJ1IDCl9y3cr+Q/FejCYJAFAmesuuEFCQenEYkACgkQr+Q/FejCYJC6yxAAiQQ5NAbWYKpkxxjP/
 AajXheMUW8EtK7EMJEKxyemj40laEs0wz9owu8ZDfQl4SPqjjtcRzUW6vE6JvfEiyCLd8gUFXIDMS
 l2hzuNot3sEMlER9kyVIvemtV9r8Sw1NHvvCjxOMReBmrtg9ooeboFL6rUqbXHW+yb4GK+1z7dy+Q
 9DMlkOmwHFDzqvsP7eGJN0xD8MGJmf0L5LkR9LBc+jR78L+2ZpKA6P4jL53rL8zO2mtNQkoUO+4J6
 0YTknHtZrqX3SitKEmXE2Is0Efz8JaDRW41M43cE9b+VJnNXYCKFzjiqt/rnqrhLIYuoWCNzSJ49W
 vt4hxfqh/v2OUcQCIzuzcvHvASmt049ZyGmLvEz/+7vF/Y2080nOuzE2lcxXF1Qr0gAuI+wGoN4gG
 lSQz9pBrxISX9jQyt3ztXHmH7EHr1B5oPus3l/zkc2Ajf5bQ0SE7XMlo7Pl0Xa1mi6BX6I98CuvPK
 SA1sQPmo+1dQYCWmdQ+OIovHP9Nx8NP1RB2eELP5MoEW9eBXoiVQTsS6g6OD3rH7xIRxRmuu42Z5e
 0EtzF51BjzRPWrKSq/mXIbl5nVW/wD+nJ7U7elW9BoJQVky03G0DhEF6fMJs08DGG3XoKw/CpGtMe
 2V1z/FRotP5Fkf5VD3IQGtkxSnO/awtxjlhytigylgrZ4wDpSE=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z+jsHGRA c=1 sm=1 tr=0 ts=689093d6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=5lxhj9nRAAAA:8
 a=OeQ8Y3SuLcdRRhuw2K0A:9 a=QEXdDO2ut3YA:10 a=OuQ7SawVy7enJLTDvLAF:22
X-Proofpoint-ORIG-GUID: HBXhzScVxFYIIKZyFtb5CAvhgum4CyNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA1OSBTYWx0ZWRfXxdrZGUyTK7ub
 1aLyQ9tnv6i/NJ3egjPRRNC3nEFbMymGnkHJ6uW0NurPDX1Mz23pgTdsn7uvB20m6dRIOjoaGFq
 ihospiHRYWOL4pCRfdZ32aWbG6S9qXh29JYIGoZM87BRoK11OgskpJ60lI7QBAmwIFAkoDifQZd
 PAPO6PdPfX6mXHbyvkM/ifg7trnRaMx9KjNPggWRwEe4r1/9FhkxB4+Pn4vRY9t1ULuBfY+G5xN
 vzcoec0+6mm70EkRWif2Ih1OrO7at3tDneqjZAlcs0HTbjQWD4j9FfDMLF2AdLsO74b+/l1GhlT
 Y0ARC6sn14WqxnYaTkoJcaK1JxCplFr81fzycdgK5mZmRBGGZgEA4kfGYEYAsYubzIp+KxdvIof
 5hvPUCO2gjSsY9xubGyTmBeUH9CnzMqCV8ukKmUke+Im+AwBc7FRWgU4xF6ZsLK90OdBFmAt
X-Proofpoint-GUID: tXLJWzrkavzZwjtPm1NJ13lVG45HX9FA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040059
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-07-31 at 15:01 +0200, Lukas Wunner wrote:
> On Wed, Jul 30, 2025 at 10:24:07PM +0200, Lukas Wunner wrote:
> > On Wed, Jul 30, 2025 at 10:01:50PM +0200, Lukas Wunner wrote:
> > > On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
> > > > Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
> > > > status for udev") AER uses the result of error_detected() as parame=
ter
> > > > to pci_uevent_ers(). As pci_uevent_ers() however does not handle
> > > > PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
> > > > beginning of recovery if drivers request a reset. Fix this by treat=
ing
> > > > PCI_ERS_RESULT_NEED_RESET as beginning recovery.
> > > [...]
> > > > +++ b/drivers/pci/pci-driver.c
> > > > @@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enu=
m pci_ers_result err_type)
> > > >  	switch (err_type) {
> > > >  	case PCI_ERS_RESULT_NONE:
> > > >  	case PCI_ERS_RESULT_CAN_RECOVER:
> > > > +	case PCI_ERS_RESULT_NEED_RESET:
> > > >  		envp[idx++] =3D "ERROR_EVENT=3DBEGIN_RECOVERY";
> > > >  		envp[idx++] =3D "DEVICE_ONLINE=3D0";
> > > >  		break;
> > >=20
> > > I note that PCI_ERS_RESULT_NO_AER_DRIVER is also missing in that
> > > switch/case statement.  I guess for the patch to be complete,
> > > it needs to be added to the PCI_ERS_RESULT_DISCONNECT case.
> > > Do you agree?

As far as I can see PCI_ERS_RESULT_NO_AER_DRIVER only occurs in the AER
code and leads to abandoning all recovery attempts for the whole
subtree with a disconnect. So my thinking is that the uevent is just
disconnect. That also matches your proposal below. Thankfully it looks
like there are still kernel messages indicating the reason of the
failure.

> >=20
> > I realize now there's a bigger problem here:  In pcie_do_recovery(),
> > when control reaches the "failed:" label, a uevent is only signaled
> > for the *bridge*.  Shouldn't a uevent instead be signaled for every
> > device *below* the bridge?  (And possibly the bridge itself if it was
> > the device reporting the error.)
>=20
> The small patch below should resolve this issue.
> Please let me know what you think.

The patch makes sense to me I agree one should get uevents for each
downstream device. Please Cc me when you send it.

>=20
> > In that case you don't need to add PCI_ERS_RESULT_NO_AER_DRIVER to
> > the switch/case statement because we wouldn't want to have multiple
> > uevents reporting disconnect, so the one emitted below the "failed:"
> > label would be sufficient.
>=20
> I'll send a separate Reviewed-by for your original patch as the small
> patch below should resolve my concern about PCI_ERS_RESULT_NO_AER_DRIVER.
>=20
> > This all looks so broken that I'm starting to wonder if there's any
> > user space application at all that takes advantage of these uevents?
>=20
> I'd still be interested to know which user space application you're
> using to track these uevents?
>=20
> Thanks,
>=20
> Lukas

Thanks for the R-b! And yes I agree we should minimize the differences
between the behavior of the implementations. I'll see if I can sync up
on this with Mahesh too.

I only tested this with udevadm so far. That said I had multiple
projects ask for ways to monitor for errors/recovery from user-space so
at least for s390 there is interest for these events. There is also a
bit of mainframe specifics here of course, for example our machines
have the ability to fail over a broken PCI link to an I/O drawer with
an alternate path and that piggybacks on these recovery mechanisms. And
generally, we're looking at expanding our support for and use of PCI
error recovery and will hopefully be sharing some more of that soon.

Also note that with the recently released IBM z17 and IBM LinuxONE 5
with Linux we're significantly expanding our reliance on native
PCI[0][1].

[0]
https://www.ibm.com/docs/en/linux-on-systems?topic=3Dnetworking-network-exp=
ress
[1]
https://vmworkshop.org/2025/present/9175tovr.pdf
>=20

