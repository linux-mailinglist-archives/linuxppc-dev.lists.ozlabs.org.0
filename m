Return-Path: <linuxppc-dev+bounces-10172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068EAFFE07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 11:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd8cb5L5qz30VZ;
	Thu, 10 Jul 2025 19:26:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752139615;
	cv=none; b=MrBlCjZFlCWh29N9VLsg9ZyTTkRCUKExzkeCt0V/aSF/woFOXC7X426cmRkWQyIsbW29AlhzNXfoFsaDT43MvB/L4BAqZcza20DalZzwT/m9WCtAZlvyigBDnfGei151BKnDhem8hZ0qnJ39CLJ6mabCDI2dwwevhR8rENSKs2/XfMFCMOP3K93HGK3sAQI4B7PF8/TUtM9MGxb4yy6yLyV8P9CwkAhf/lFZ0SZhHxckSaXqTUN026moMUlXIcAg2ZkQGtXwTfQKtSeniCI2EDrGrXmY6VxrLJbf+oUQnJFfSrs1PUwGZFYzi2j4/JAXmeyipmWqqZmRmkbIl9g8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752139615; c=relaxed/relaxed;
	bh=s3u6yvQkY9bYGVi7oknr9+I7sVm5Oet6jhO0Uh4W4oI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=LAEgmZGZhAQeNZ319cHbrOiAU30AqbvGCoK5NX4HcN1rDF2EoaSsSgPVeVuOnFfaWMviWjpwLLyyZWcPdXeKouRmiM688ke2kZPN7vyrq/KV1OL46XexEYOHXgv8FKqI6wwsVwtZzwXW0Fg9k1jJRNaEF4fTNcZaHdhupfn0yJur2h/iJ+RyJiQ7Ne3Nlpz+kd8D0P5sg3HGW7sIWBGeOVEyAHeUJqNxlQ66qYXIejrbS6S7Bu5D+r37RKD4ovFk9D0cHRHiM3P2ykLIQ/TV8PKAHy+RRtpRnqUUwr0Si08Dc6mmCrohGLe9umxnbTcdUj76I5j/BKYWCobYUeWeaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osqQgYgJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osqQgYgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd8cY5PWhz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 19:26:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A2HDn1017342;
	Thu, 10 Jul 2025 09:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=s3u6yvQkY9bYGVi7oknr9+I7sVm5
	Oet6jhO0Uh4W4oI=; b=osqQgYgJ3tToDC5AJj0OLXtHc7svnedtWhrd3oLf9NV+
	u755lK2il3MJO+f0kAHScSUxhLH+YcFZi1g9pVzXwIelrw1EmY+hw/w734/xGQsd
	d8AYH/Tq4wvI70aXI5CCNcChsb0ohDSab13FxvI+9FkNxQhdbW67Jvqk5NxvrmHV
	Qq7UfO77WW4ciPyDdpZujex2Cxir244t+2Zw6SkWbGun5BQMiBY1JfCgzcWtWJ5L
	QlZHAGCNHrE2CazIB/uSaVlwD5064/s3TXJUmRm/6Al7lQBtWt+ytLGT+55YFgT6
	uya4vxWVx6M8gLvYc06Q/3X+/Q8alAIQiCsDmVdl/Q==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqnjubv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:26:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9DY7E021531;
	Thu, 10 Jul 2025 09:26:42 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47qectw48r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:26:42 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56A9QgR81901724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jul 2025 09:26:42 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18BD458054;
	Thu, 10 Jul 2025 09:26:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A44B58050;
	Thu, 10 Jul 2025 09:26:40 +0000 (GMT)
Received: from [9.61.242.136] (unknown [9.61.242.136])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Jul 2025 09:26:39 +0000 (GMT)
Message-ID: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
Date: Thu, 10 Jul 2025 14:56:38 +0530
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
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20250709] Fails to boot on IBM Power Server
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=FZ43xI+6 c=1 sm=1 tr=0 ts=686f8753 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=JL_kxwBaEviHOjYOxfAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RlLNcGwiqwLPGgoOr1YZcK6qLIPBnunh
X-Proofpoint-ORIG-GUID: RlLNcGwiqwLPGgoOr1YZcK6qLIPBnunh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXxI6nqg3f/71w 6+LhI+FSnZK6QcFOxISSSdWU9rHqre+HOyrg6jak3TJtgd48cWgE+VfUR33PNZZCqZvWMZIvluD 5h24r1dfW+tv/GdDygU4IGxzPEQsZ0cAuNXV/9XXyV87ABtT+N6p80K3ZkV1nA1F4Yxlt3AA7aG
 uH3hFVs3TXCkQH5q6nJN3htUp/D0aYnaVJCgaKRpQJ76HmANnv5ksIt2AK8HdygvrPcIeiVC66N o9S8oZSvxvOuZseo/OqRKW4Qr3PJid0E4XNQBZ2NowUSdTigycsm/Jk9UH7O7tMA/oHfnmU5Hk0 ay/OKcGWP7hopQcgwnRcQPe8vO/EX3y+d3cHu0nlt/IkUxgPOJje9nvKHjxki3k0EdFsbbpJDF8
 GlGpq9mvZPHQNQUKGNFyoxUj/1F6dgUR3UP2AH+lLy6Ad/LBVXFUkUSthwuFJXSq3cPcV2zU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=745 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


IBM CI has reported a boot issue on the latest linux-next(20250709) 
kernel fails on IBM Power servers.

System entering to emergency mode.


Error:


[    1.071678] ibmveth 30000002 net0: renamed from eth0
[    1.074227] ibmvscsi 30000069: SRP_VERSION: 16.a
[    1.074238] ibmvscsi 30000069: Error -4 opening adapter
[    1.074255] ibmvscsi 30000069: couldn't initialize crq. rc=-1
[    1.181132] ibmvscsi 30000069: probe with driver ibmvscsi failed with 
error -1
[  146.631585] dracut-initqueue[320]: Warning: dracut-initqueue: 
timeout, still waiting for following initqueue hooks:
[  146.632266] dracut-initqueue[320]: Warning: 
/lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2fc034bf95-13cb-46a0-b66e-78faa57bc520.sh: 
"if ! grep -q After=remote-fs-pre.target 
/run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
[  146.632493] dracut-initqueue[320]:     [ -e 
"/dev/disk/by-uuid/c034bf95-13cb-46a0-b66e-78faa57bc520" ]
[  146.632628] dracut-initqueue[320]: fi"
[  146.633622] dracut-initqueue[320]: Warning: dracut-initqueue: 
starting timeout scripts
[  147.203267] dracut-initqueue[320]: Warning: dracut-initqueue: 
timeout, still waiting for following initqueue hooks:
[  147.204238] dracut-initqueue[320]: Warning: 
/lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2fc034bf95-13cb-46a0-b66e-78faa57bc520.sh: 
"if ! grep -q After=remote-fs-pre.target 
/run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
[  147.204460] dracut-initqueue[320]:     [ -e 
"/dev/disk/by-uuid/c034bf95-13cb-46a0-b66e-78faa57bc520" ]
[  147.204603] dracut-initqueue[320]: fi"
[  147.205561] dracut-initqueue[320]: Warning: dracut-initqueue: 
starting timeout scripts
[  147.767680] dracut-initqueue[320]: Warning: dracut-initqueue: 
timeout, still waiting for following initqueue hooks:
[  147.768382] dracut-initqueue[320]: Warning: 
/lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2fc034bf95-13cb-46a0-b66e-78faa57bc520.sh: 
"if ! grep -q After=remote-fs-pre.target 
/run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
[  147.768649] dracut-initqueue[320]:     [ -e 
"/dev/disk/by-uuid/c034bf95-13cb-46a0-b66e-78faa57bc520" ]
[  147.768788] dracut-initqueue[320]: fi"


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


