Return-Path: <linuxppc-dev+bounces-9358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3152AD9317
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 18:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJlfd69b2z2yb9;
	Sat, 14 Jun 2025 02:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749833209;
	cv=none; b=eoX+sWvLRNcg4kOMWgvTk0eTtu7O+cU4fgtEjWdnHewCwqdC90uIH6VeJsjVv8xv8cQs9BTbUm2YC9fvCmDDJO7VqagJn4XLnX4Q8IUuv4beufuk8EhZ2wINRtbprzLHlSOm2tkewHFJXz7E++Qv3mSwxhvbVwePZSTM/WUVdnirSt8TlRQVjLeQ+yHRBcluUSaI/G9wJXyxf5DhtnhjOPSQrXA7fwL+m/PdlGf00oPeOj0Ubi55pUjO/zBNSRfStPoxx8Kj/8vaeGLygt9vI2OQo30IaX5x7ZTB4QlD/XafNQyu/uIm/L3p6g5kHPg4hBTJW1fv57946jqKhgJ5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749833209; c=relaxed/relaxed;
	bh=9XRJ3S4WgErLGjeCRtjOZDmlS3isbzU/ag+CU74FgQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKJ1SP4kOxksOr8flKgr8KkGPkRTzjrrHiFa3NZMSt75uYZoJwqTf28LQfRFSrHDEWPTJk7Da0RIHsnPyQzKk22HDNMCyKpw58b0U+scSjGqVZKjJpp+wyOliuNJGOul5sVDW1JIQK99BS/jYWrL4g9EfvWXhnKkNbBiFRDHocLcuDJnBOW1CceO/mDhqF96L0FizmV25XXE49XVsnwssYZpnbA1vX4Bcs5ZMGXuEJpqK4XN5LJBhxiD81EclQ8+BfcPcmWA7bmA6Pz23XdBN3rVkYNRpf1b+4+x1e6b6gh7elmtAoDa0Di6M7wpnPalAF6SZN1s6Ib1yE7LBXsoVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOaHrpXW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOaHrpXW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJlfc4wnZz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 02:46:48 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9BdNF026464;
	Fri, 13 Jun 2025 16:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9XRJ3S
	4WgErLGjeCRtjOZDmlS3isbzU/ag+CU74FgQc=; b=cOaHrpXW+VeUtthSrhDHfy
	Onf2bXuXTFuSZbv81lcEMtbt/20N8pt5H7hTkOGQXno5tKZs+PrQzXhj6cCXwaRw
	nlyzDDPWZ4o9EdS0pB0Z77xLC8/GikJlzIfqy0Aj3KL8EJ+46PBtN57/l0OFTBCR
	FTDtjl1J/tF1bylIjjuDTyNDzns7eD96K4KYJfA5n9AeMnnkhna80SQeyOWHNJTb
	apO05wdtoYZylFakb8Rx4YU+GgIbpl6lDt5CyJ0NtoCg3zq7rx3Ys8TbtEWFVO6x
	Kx4m2ehL7UtJrjaSzj2HoJaRjB/whBwsZhyohveEFe1dVOGWdL5KT49b4dFESgXw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjtgc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:46:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55DGeMur031453;
	Fri, 13 Jun 2025 16:46:32 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjtgbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:46:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DE7hMx015006;
	Fri, 13 Jun 2025 16:46:26 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpk008-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:46:26 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DGkPfL31523416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 16:46:25 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F014058053;
	Fri, 13 Jun 2025 16:46:24 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FFB558043;
	Fri, 13 Jun 2025 16:46:20 +0000 (GMT)
Received: from [9.43.6.70] (unknown [9.43.6.70])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 16:46:19 +0000 (GMT)
Message-ID: <ebeb28ee-272a-4965-8add-42d005cbed38@linux.ibm.com>
Date: Fri, 13 Jun 2025 22:16:16 +0530
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
Subject: Re: [PATCH v2] powerpc: Fix struct termio related ioctl macros
To: Justin Forbes <jforbes@fedoraproject.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        linuxppc-dev@lists.ozlabs.org, Tulio Magno <tuliom@ascii.art.br>
References: <20250517142237.156665-1-maddy@linux.ibm.com>
 <87zff7fu1p.fsf@mpe.ellerman.id.au> <aExSkR32YIgXtEHm@fedora64.linuxtx.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <aExSkR32YIgXtEHm@fedora64.linuxtx.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HbzhGlYJotBojLQdJh1muhOcqBCU258t
X-Proofpoint-GUID: ni0je-LW6Bssv6dVLe-FZjLeMgqe-vn-
X-Authority-Analysis: v=2.4 cv=fZWty1QF c=1 sm=1 tr=0 ts=684c55e9 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=vTr9H3xdAAAA:8
 a=0oxY9S99ikzlAryYtrkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEyMCBTYWx0ZWRfX1tWX2b8BK5ks YbRVu9OjnjfVvG1VeZqkERerk5enz3LgP10O85RmyLxMFdCTlSDJR/ovOy8BkJhhBtjt1ewHZaw 8YD57WAglsM9+GJf/JxtSILa6D0nn6ysshtMYMCzdQpB9WZkEDnvoR9gKiX7YdGxrhYZycXRfUA
 ahhw0kXOX49ZmLbKSMDvtRR/n49Wv84VgUQ8w5nqVV5lR6UkqvuvS5IIGx2PgrdxSk9d9VRp8DN wowCEmkL6xti40zfzuZ374AeV+MtUu5o61cj5M+6efxkHJGLIhOeMercWSkw0V0XEKAsGxUa3p4 fchJtNR0p4xaBQtQY95TznDYpDSgNhf198aleHcDJoaIyVBgyz5x3Wwj4dwllz5DPfMc79dGbwV
 55nK9XppvPy3tQbLMLPBQcPZo3BwaRSpDhsLDas/EGuMbwtnVfM+ydcDwNFBX6qBQf2KFMjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=946
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130120
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/13/25 10:02 PM, Justin Forbes wrote:
> On Tue, May 20, 2025 at 08:36:18PM +1000, Michael Ellerman wrote:
>> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>>> Since termio interface is now obsolete, include/uapi/asm/ioctls.h
>>> has some constant macros referring to "struct termio", this caused
>>> build failure at userspace.
>>>
>>> In file included from /usr/include/asm/ioctl.h:12,
>>>                  from /usr/include/asm/ioctls.h:5,
>>>                  from tst-ioctls.c:3:
>>> tst-ioctls.c: In function 'get_TCGETA':
>>> tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
>>>    12 |   return TCGETA;
>>>       |          ^~~~~~
>>>
>>> Even though termios.h provides "struct termio", trying to juggle definitions around to
>>> make it compile could introduce regressions. So better to open code it.
>>>
>>> Reported-by: Tulio Magno <tuliom@ascii.art.br>
>>> Closes: https://lore.kernel.org/linuxppc-dev/8734dji5wl.fsf@ascii.art.br/
>>> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
>>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> ---
>>> Changelog v1:
>>> - mpe pointing out mistake in hardcoded values.
>>>   Fixed the same.
>>>
>>>  arch/powerpc/include/uapi/asm/ioctls.h | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
>>> index 2c145da3b774..b5211e413829 100644
>>> --- a/arch/powerpc/include/uapi/asm/ioctls.h
>>> +++ b/arch/powerpc/include/uapi/asm/ioctls.h
>>> @@ -23,10 +23,10 @@
>>>  #define TCSETSW		_IOW('t', 21, struct termios)
>>>  #define TCSETSF		_IOW('t', 22, struct termios)
>>>  
>>> -#define TCGETA		_IOR('t', 23, struct termio)
>>> -#define TCSETA		_IOW('t', 24, struct termio)
>>> -#define TCSETAW		_IOW('t', 25, struct termio)
>>> -#define TCSETAF		_IOW('t', 28, struct termio)
>>> +#define TCGETA		0x40147417 /* _IOR('t', 23, struct termio) */
>>> +#define TCSETA		0x80147418 /* _IOW('t', 24, struct termio) */
>>> +#define TCSETAW		0x80147419 /* _IOW('t', 25, struct termio) */
>>> +#define TCSETAF		0x8014741c /* _IOW('t', 28, struct termio) */
>>
>> These values look right to me. And the values should never change, so
>> hard-coding them is a reasonable solution.
>>
>> Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> Has this been forgotten? We are having to carry it for userspace to
> continue, and this should really be pushed to Linus.
> 
> Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
> 

My bad, I will add this to my fixes-test
and sent it as part of my next fixes PR

Maddy



>>
>> cheers
>>


