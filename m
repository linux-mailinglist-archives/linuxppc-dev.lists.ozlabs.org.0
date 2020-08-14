Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09A2442B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 03:31:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSQrC6x3mzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 11:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSQpK0LbNzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 11:29:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fSuyijls; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BSQpH26BRz9sPB;
 Fri, 14 Aug 2020 11:29:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597368568;
 bh=2nL1s/GGGUnkoJ6Qilb5RGZzZJxuT4nGNS/W3kppc2M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fSuyijls9JAQcshLNkYvCbwLUGfaDaq6CBB84EIkutZzjy0mUzk+XNeSyIGJOaVMn
 PKqS2JJaznQ75hg3919YeaV7uIeHMsPsQYiFruGS/FYTEZ3LNnVBeDaUZwHQN37Zg2
 FmuE2cu9JWjxxKmGOzivUSwPeLyTcgVpUu0hnM9nfZYQ5dUN/obMXINMx6K4Fu0GQu
 t7CXQStQBS5FduSCcEvYdNbrU3n2iQeipFSyO4rMF4NP6tLgDRbYautmQIW73vxIe3
 Uvm7MRoMcRnd0N6OnC+5gUeRP9i31lcas92xt6sEaQtRIRzcaqe8t1IBM/FfhaRr1L
 s1UdEKDma105g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH] powerpc/papr_scm: Limit the readability of 'perf_stats'
 sysfs attribute
In-Reply-To: <13e82e40-35c7-266c-2ec0-5fcdcb5fb27f@linux.ibm.com>
References: <20200813043458.165718-1-vaibhav@linux.ibm.com>
 <13e82e40-35c7-266c-2ec0-5fcdcb5fb27f@linux.ibm.com>
Date: Fri, 14 Aug 2020 11:29:23 +1000
Message-ID: <87imdm9frg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Santosh Sivaraj <santosh@fossix.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 8/13/20 10:04 AM, Vaibhav Jain wrote:
>> The newly introduced 'perf_stats' attribute uses the default access
>> mode of 0444 letting non-root users access performance stats of an
>> nvdimm and potentially force the kernel into issuing large number of
>> expensive HCALLs. Since the information exposed by this attribute
>> cannot be cached hence its better to ward of access to this attribute
>> from users who don't need to access these performance statistics.
>> 
>> Hence this patch adds check in perf_stats_show() to only let users
>> that are 'perfmon_capable()' to read the nvdimm performance
>> statistics.
>> 
>> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/papr_scm.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index f439f0dfea7d1..36c51bf8af9a8 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -792,6 +792,10 @@ static ssize_t perf_stats_show(struct device *dev,
>>   	struct nvdimm *dimm = to_nvdimm(dev);
>>   	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
>>   
>> +	/* Allow access only to perfmon capable users */
>> +	if (!perfmon_capable())
>> +		return -EACCES;
>> +
>
> An access check is usually done in open(). This is the read callback IIUC.

Yes. Otherwise an unprivileged user can open the file, and then trick a
suid program into reading from it.

cheers
