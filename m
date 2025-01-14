Return-Path: <linuxppc-dev+bounces-5214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9BA1018F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 08:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXLy45dgXz300V;
	Tue, 14 Jan 2025 18:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736841292;
	cv=none; b=fH1SW0GuZMudElpZi24i/3p9wlpn+aiX2+6NzKkCOWHbqUakJRn1YMIVpxIefmSJJI54PuRauS8Jn6pF4bKZjctJwjk/ui2DYlZ04pUWwMBRchXUUAHgjcDUU/9ux+bq+2jC/n2tNXNoG0y/wn/UOE+ct3Rjoex0W9n5fm4zm9B7Xt8FCGrF7OPtB2lvfppTbbmDFKYmWouB/BZWZW9fm5uff3vKzRTyhUpqne3Y5ccog13l3TBu6wEZ+OgG3apJfCuYMung4ZwaCoFkOLucds+gnGeiB8bHIBEZg2C+1DN+TzEWXNQ+KlUKIY1ud+3ZkjblDtHVlZk+XJqfiudX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736841292; c=relaxed/relaxed;
	bh=DyyPnyTOEuxgVfwm5K0hM1cGz/+PCtWa8xOenl7ZRnU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gIqyfK8zg7HaMnk5cuHH95ZowJHCJcs8IcKXrdAlaSL7PEsy3Qi7DUO8V0O/tBKLC9hHH1CJLsOchgTK6jNtIna3Zjxe5wAocs3R3U7qV9vHpnGhHTPEDKHh5fsrPzx6vwobMapV6JkrglbdaFMFZU2hs/9yuA/BqsHd3ygfP/MYD6Azgl2Pf1VDLd5r1pYKXKvgwb3BR1KPEPRUFZxP/yy/o37c08SDp3LPfGF3iQUJsLAbPBJn2qlMW5rKMUc034U1oV7v38Ug1zDexq9+Gs//ffzZ6KO8kVgALRFosL2+IZleH56ffEX4YS3GIkTB7xy5ClMXev7HNb1a1ijRAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FJs/+9sJ; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FJs/+9sJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXLy30plzz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 18:54:50 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E3qkc6003540;
	Tue, 14 Jan 2025 07:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DyyPny
	TOEuxgVfwm5K0hM1cGz/+PCtWa8xOenl7ZRnU=; b=FJs/+9sJnoF46qBhISRJc+
	3ISzi9ATO//PjuVrK3O3l79bGXoNtAlJme9952cR61Xoao4KVASzB/o4WtROUOUh
	zN2LB+l+OQUdB7HjHWfsHc47laIc3tmcZNbf1sEX/QD1A7KH+PsDH0ZGpEB2wJ+A
	wGkCvkwnNdU+YMFUNVW0LrCnmm/0h8nt99FTTP/VEnIM7WL1VCUiWOHmP3e22lnp
	h7S4QVeh9UaEPRzfzfV5smuYvKS792JcXL3wZrU/5kR4H/+1hij3ayXkO0htHl0/
	oKtJs/iGyAE4psbQmuUXgv7I0WIjB+B5sHDXl7VR1XAmvxfB9qhtWOwuG2XGBHKQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjgrtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:54:45 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50E7sjCl020730;
	Tue, 14 Jan 2025 07:54:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjgrtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:54:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50E5Hdih017366;
	Tue, 14 Jan 2025 07:54:44 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fk24j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 07:54:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50E7sebN35979760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 07:54:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21A7C20043;
	Tue, 14 Jan 2025 07:54:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D5E920040;
	Tue, 14 Jan 2025 07:54:34 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.251.19])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 Jan 2025 07:54:34 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH V2] tools/perf/tests/base_probe: Fix check for the count
 of existing probes in test_adding_kernel
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4UsBYLWa1CJfn3F@x1>
Date: Tue, 14 Jan 2025 13:24:19 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org, mpetlan@redhat.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <371F1454-EFBF-496B-B27C-341700488B96@linux.vnet.ibm.com>
References: <20250110094324.94604-1-atrajeev@linux.vnet.ibm.com>
 <07be4391-4a28-4761-9171-26580aea6312@redhat.com> <Z4UsBYLWa1CJfn3F@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Veronika Molnarova <vmolnaro@redhat.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uCa65NgVI4cG2ZsRz6XyDFDFYGpl_dnS
X-Proofpoint-ORIG-GUID: GQBcSFno-YioZh7NDQlpPb44KLKClzBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=998
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 13 Jan 2025, at 8:36=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Mon, Jan 13, 2025 at 11:21:24AM +0100, Veronika Molnarova wrote:
>> On 1/10/25 10:43, Athira Rajeev wrote:
>>> But if there are other probes in the system, the log will
>>> contain reference to other existing probe too. Hence change
>>> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
>>> This will make sure expecting string comes in the result
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>=20
>> Acked-by: Veronika Molnarova <vmolnaro@redhat.com>
>=20
> Thanks, applied to perf-tools-next,
>=20
> - Arnaldo
Thanks Veronika for the ack and thanks Arnaldo for pulling in the patch

Thanks
Athira=

