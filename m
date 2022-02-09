Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606444AF8C9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 18:51:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv6rM4HkWz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 04:51:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6SLGacB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h6SLGacB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv6qh3dYjz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 04:50:55 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219HXOnu010863; 
 Wed, 9 Feb 2022 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=QeqGal7MgbMhenMGOE838rSOY3uP/BzQ/XkJwqD0plE=;
 b=h6SLGacBZkYizKPd9+3hiUu9OQmXJV7iqGiUq+g/CPtTyAr/hOjMHS3+X1aLPwvgc5l8
 AhN8fSBtMfGhPRYS99aNHfbTn6Laoiq0Qey8beGTNtH7XihOxtf/lz/Lewb+AHMna1FK
 +EF/sF3r0feEdXOAdYjCAnk+fPV6bl3VszzgTvfljYCzYbpV8YB565JkGhWSh6fwAmDq
 WokXsWgiExFkyELJfQfQH3gC1LOOpI4umtTwDzZ4R4jTnCD2R8ebWwuwqIYHPKLkT7it
 q9FWEzH4hfzrH2fcr/RVhbWaHxTVmjoywoX97XDKI4IuOrxVfnqxz/UA4KAp7x7v7Uzn gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3tsttcvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 17:50:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 219Hh0nl017532;
 Wed, 9 Feb 2022 17:50:17 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3tsttct8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 17:50:16 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 219HXPxW021373;
 Wed, 9 Feb 2022 17:50:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3e1gv9qg56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 17:50:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 219HoBXR24641898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 17:50:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 686C0A4067;
 Wed,  9 Feb 2022 17:50:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0825CA4064;
 Wed,  9 Feb 2022 17:50:11 +0000 (GMT)
Received: from localhost (unknown [9.43.32.201])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Feb 2022 17:50:10 +0000 (GMT)
Date: Wed, 09 Feb 2022 17:50:09 +0000
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] powerpc/ftrace: Override ftrace_location_lookup()
 for MPROFILE_KERNEL
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220207102454.41b1d6b5@gandalf.local.home>
In-Reply-To: <20220207102454.41b1d6b5@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644426751.786cjrgqey.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -_rZY9735z-lbnaeR_XjQGVNW1GJwLL2
X-Proofpoint-GUID: OyACoGB9tlRavdZ1b-quXMIPAIsdqHSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_09,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090096
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Mon,  7 Feb 2022 12:37:21 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -1137,3 +1137,14 @@ char *arch_ftrace_match_adjust(char *str, const c=
har *search)
>>  		return str;
>>  }
>>  #endif /* PPC64_ELF_ABI_v1 */
>> +
>> +#ifdef CONFIG_MPROFILE_KERNEL
>> +unsigned long ftrace_location_lookup(unsigned long ip)
>> +{
>> +	/*
>> +	 * Per livepatch.h, ftrace location is always within the first
>> +	 * 16 bytes of a function on powerpc with -mprofile-kernel.
>> +	 */
>> +	return ftrace_location_range(ip, ip + 16);
>=20
> I think this is the wrong approach for the implementation and error prone=
.
>=20
>> +}
>> +#endif
>> --=20
>=20
> What I believe is a safer approach is to use the record address and add t=
he
> range to it.
>=20
> That is, you know that the ftrace modification site is a range (multiple
> instructions), where in the ftrace infrastructure, only one ip represents
> that range. What you want is if you pass in an ip, and that ip is within
> that range, you return the ip that represents that range to ftrace.
>=20
> It looks like we need to change the compare function in the bsearch.
>=20
> Perhaps add a new macro to define the size of the range to be searched,
> instead of just using MCOUNT_INSN_SIZE? Then we may not even need this ne=
w
> lookup function?
>=20
> static int ftrace_cmp_recs(const void *a, const void *b)
> {
> 	const struct dyn_ftrace *key =3D a;
> 	const struct dyn_ftrace *rec =3D b;
>=20
> 	if (key->flags < rec->ip)
> 		return -1;
> 	if (key->ip >=3D rec->ip + ARCH_IP_SIZE)
> 		return 1;
> 	return 0;
> }
>=20
> Where ARCH_IP_SIZE is defined to MCOUNT_INSN_SIZE by default, but an arch
> could define it to something else, like 16.
>=20
> Would that work for you, or am I missing something?

Yes, I hadn't realized that [un]register_ftrace_direct() and=20
modify_ftrace_direct() internally lookup the correct ftrace location,=20
and act on that. So, changing ftrace_cmp_recs() does look like it will=20
work well for powerpc. Thanks for this suggestion.

However, I think we will not be able to use a fixed range.  I would like=20
to reserve instructions from function entry till the branch to=20
_mcount(), and it can be two or four instructions depending on whether a=20
function has a global entry point. For this, I am considering adding a=20
field in 'struct dyn_arch_ftrace', and a hook in ftrace_process_locs()=20
to initialize the same. I may need to override ftrace_cmp_recs().


Thanks,
- Naveen

