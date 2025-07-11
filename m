Return-Path: <linuxppc-dev+bounces-10179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F7B011CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 05:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bddFg6Lgrz30VF;
	Fri, 11 Jul 2025 13:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752206231;
	cv=none; b=I5qXC9YQq5lu01KewyTliK4cqwYzz1V3c7h76DXNnr+/MRlsMkO86L+zl4DXgcanyqBft7Yn1iy30e8sSjZOwCAIe0ZiT+sM2h1HSLdwqTaAZ5JqBn7pUz5Azb2eUVhSFk1FwEVEsyTQS9/3KawvXJ3x7zqUKVHn3qt9SI8x68HYs4NaFQaOWpjUlCz0PY62p+Iy8acFGq/1xVPtN1m3EN3aLpaWlQv5OtuJrzzm5yh3z9imbvESiovShQpqRlygemye5XUph11SPb3ImiKbKsiiG+qNQpDnCZhWGddtpEJnxeIFuAbqA3JImWPbKhutW0LnWW/znSGoL337zYuw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752206231; c=relaxed/relaxed;
	bh=PpFaaKOyRLlzmKKw/kVccNlMuBTJgCal3Vp5o+WDkAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPyRu4fDveu8xunpH2e5bMepB5j1/0wv7gfFzR9FpOV7QYwtbfpn/JO/njsYkNHfXDJi5FGvpozfRYEuhb6JcwLaV2+T/uR4zT1uoJ03jUS/0KP0EY2J7dUp4ufrVF0ic6EzxCanrdmdMSFqJ9YFfMc8VAtwhlo/mRjUlZtMLWsYhvdLv1sNYL4faak+iNkaBYhRa6Qs+EhGi1l1eoIRtEnRafFheXqqkfcVLWC6pv6+Q+OxtwFMyb2gMXGzbmdo1oIck5J9mD59RJI762XdCTohRjh88nDRdapO2SXACDeezJR0f1KONlaYxohMEhS1eMXsvCHbh5f4nd1O5qmizA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F9KtfoQ1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F9KtfoQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bddFg0NVFz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 13:57:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AN3g3i021182;
	Fri, 11 Jul 2025 03:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PpFaaK
	OyRLlzmKKw/kVccNlMuBTJgCal3Vp5o+WDkAY=; b=F9KtfoQ1lV+rTa78XFQnQV
	PUgKR/GseqM+8G8GZB6ICruh6pqe9T3unIGvuuSbHv2Zn0SaW0m2YXyNhx5TOyNW
	mOymnaDf1snhFyKL6Yh1FRTN7JNUT9guxyIMnx7MYGqIY6ZxbVgAA53YXpmVENZL
	tqcCm0Y4Hje+iBu+aKPeYn7BC2DvWUWuazK40r22Ns370RaoUJYi1LyCbHKhJjC7
	SjV99tGRQj6lf1sZNfKTQMTB8Jk2IVWOaL39qNUs1pc6D9RDHzp9HuK71iGqMh0C
	zxK2vAM3dm5kIcSGc0QyhnhW+AlVHi4K1m1NnOiTGKJIYOC85wb2WOcBfsjrAzgA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pussgnqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 03:57:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1vung010807;
	Fri, 11 Jul 2025 03:56:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qes0h1mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 03:56:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56B3uwUG27525680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 03:56:59 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B588C5805D;
	Fri, 11 Jul 2025 03:56:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB9315805A;
	Fri, 11 Jul 2025 03:56:56 +0000 (GMT)
Received: from [9.61.253.167] (unknown [9.61.253.167])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Jul 2025 03:56:56 +0000 (GMT)
Message-ID: <ba967f4d-4b55-4199-af1e-f3a7f30d7158@linux.ibm.com>
Date: Fri, 11 Jul 2025 09:26:54 +0530
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
Subject: Re: [next-20250709] Fails to boot on IBM Power Server
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
 <20250710202234.7fd45cd1@canb.auug.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250710202234.7fd45cd1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Vaj3PEp9 c=1 sm=1 tr=0 ts=68708b8d cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=iKqzQSD2Ew3xwzP_rSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: i7TFREHMfo9NBbnkytgXXIQUuY-_KvqH
X-Proofpoint-ORIG-GUID: i7TFREHMfo9NBbnkytgXXIQUuY-_KvqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAyMiBTYWx0ZWRfX3qYvB6M5xKWR inPzwIEvFfyuKODhFBQu9nees6V9KbSPWjJQ/MWJ2dkdBbuZCtWVwx5lOxZfWM69dn/QsbCM0i7 KcoOf1SDLSGRr/WjMzkZ84A7453kGlqxkIlzmgSiDUBIhxv7DhxW8AchEXxdQQ0R+GflI2W0PgM
 xCoDAtLteXFLfwLZwLMAfcUHavkuNw8ZcIxS6Dvg0TJLOFLijSR7pkkE30FCilsD1mF1rhYlidn b/+FV/6kKH0Uao6tXlvyqOhENISi2N9H3LXKObmzQuZ/KMOC1f0ROYIgezD8bH3WUrK8aLmGe/8 RHiZ8j2oYNm8HxzsWvGW9Ba9RdA5J5BQ6z0lsdt0cIgFrwGDBuOPBqpiHEj7RWF9lXtJYF0wCmo
 TRwYv5e4PWIROd5TBYHzYzzUlzs/0BkWv79E42CZ1ZxlJgSo0BJ/4NPv62JGhmj7PnbO4LKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=557 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/07/25 3:52 pm, Stephen Rothwell wrote:
> Hi Venkat,
>
> On Thu, 10 Jul 2025 14:56:38 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>> Greetings!!!
>>
>>
>> IBM CI has reported a boot issue on the latest linux-next(20250709) kernel fails on IBM Power servers.
>>
>> System entering to emergency mode.
>>
>>
>> Error:
>>
>>
>> [    1.071678] ibmveth 30000002 net0: renamed from eth0
>> [    1.074227] ibmvscsi 30000069: SRP_VERSION: 16.a
>> [    1.074238] ibmvscsi 30000069: Error -4 opening adapter
>> [    1.074255] ibmvscsi 30000069: couldn't initialize crq. rc=-1
>> [    1.181132] ibmvscsi 30000069: probe with driver ibmvscsi failed with error -1
> This has been fixed in next-20250710, just released.
>
> See: https://lore.kernel.org/linux-next/20250709233953.7afb7a8a@canb.auug.org.au/

Thank you Stephen.


Regards,

Venkat.


