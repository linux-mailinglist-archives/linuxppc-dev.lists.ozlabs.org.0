Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D70124873C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 08:49:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVb3B5YcKz30Lb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 18:49:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RsHm0sNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RsHm0sNP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVb2P5Ypzz30DX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 18:49:01 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2075c41p004563; 
 Fri, 7 Jan 2022 07:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IqwWaaiJ7DAXqjwid9Fguvy0TRClyCHC1Jo6C5uf9zw=;
 b=RsHm0sNPIh9XoxImiRz9M9cHqCtXvtDW6wtmmoSVqNnPSOcHEy7GMfJwSxhpFKHMXKhR
 Buen5fkqkn7OVPQsps8ZQdpHZapgUwBEVkfTiIl8Ue0/UEwytOq8HScxNztUR60tW0uv
 0jMyOU55T3tv/LB+ivyDGSph596vBlS6RPSO+Q+SnB+eqCaFPXt3T363OaTCTc0iXBMn
 B58NISxqhTE26ssjL5Dc+bisZi8qniYPFE9DDaBImRMVW99KKay8eyYTiBU7RiputCX2
 R9SHSHIzPTUB39TnLGGWx7MXAlb/M1wJXAO/J9PlIzahqnGJnewbXBJZmYy9BPkp7G7Y 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wxbudj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:48:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2077mR7u022202;
 Fri, 7 Jan 2022 07:48:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wxbucv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:48:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2077mBW4006515;
 Fri, 7 Jan 2022 07:48:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3de5gfuwpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:48:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2077mWHN17105338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 07:48:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0A8A11C05B;
 Fri,  7 Jan 2022 07:48:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7607311C058;
 Fri,  7 Jan 2022 07:48:31 +0000 (GMT)
Received: from localhost (unknown [9.43.90.227])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 07:48:31 +0000 (GMT)
Date: Fri, 07 Jan 2022 13:18:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/ftrace: Handle large kernel configs
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20181016202500.28039-1-naveen.n.rao@linux.vnet.ibm.com>
 <e1397c7f-abbd-c5dc-1bf6-74f409b07b4c@csgroup.eu>
In-Reply-To: <e1397c7f-abbd-c5dc-1bf6-74f409b07b4c@csgroup.eu>
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641541262.djkf8dxvi1.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _SAr_lhjiB-luRnt5MihtPxw2gnBqKOQ
X-Proofpoint-GUID: ahApNkzlwvTzgJAd9zZ0Qr0DZK-1Eppl
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_02,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=864 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070053
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,
Sorry for the delay, catching up with some of the earlier emails now..


Christophe Leroy wrote:
> Hi Naveen,
>=20
> Le 16/10/2018 =C3=A0 22:25, Naveen N. Rao a =C3=A9crit=C2=A0:
> ...
>=20
>> +/*
>> + * If this is a compiler generated long_branch trampoline (essentially,=
 a
>> + * trampoline that has a branch to _mcount()), we re-write the branch to
>> + * instead go to ftrace_[regs_]caller() and note down the location of t=
his
>> + * trampoline.
>> + */
>> +static int setup_mcount_compiler_tramp(unsigned long tramp)
>> +{
>> +	int i, op;
>> +	unsigned long ptr;
>> +	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
>> +
>> +	/* Is this a known long jump tramp? */
>> +	for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> +		if (!ftrace_tramps[i])
>> +			break;
>> +		else if (ftrace_tramps[i] =3D=3D tramp)
>> +			return 0;
>> +
>> +	/* Is this a known plt tramp? */
>> +	for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> +		if (!ftrace_plt_tramps[i])
>> +			break;
>> +		else if (ftrace_plt_tramps[i] =3D=3D tramp)
>> +			return -1;
>=20
> I don't understand how this is supposed to work.
> ftrace_plt_tramps[] being a static table, it is set to 0s at startup.
> So the above loop breaks at first round.
>=20
> Then ftrace_plt_tramps[i] is never/nowhere set.
>=20
> So I just see it as useless.
>=20
> Am I missing something ?

No, that's correct. I had posted a cleanup of this a year back as part=20
of the ftrace_direct enablement. I have updated that series and will be=20
posting it out soon (though I should rebase it atop your livepatch=20
series):
http://lkml.kernel.org/r/bdc3710137c4bda8393532a789558bed22507cfe.160641243=
3.git.naveen.n.rao@linux.vnet.ibm.com


- Naveen
