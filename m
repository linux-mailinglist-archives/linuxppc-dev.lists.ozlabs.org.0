Return-Path: <linuxppc-dev+bounces-12307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F8B7C8FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 14:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRXlj2PD4z3cYN;
	Wed, 17 Sep 2025 19:00:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758099601;
	cv=none; b=i7mABIoiquOFy/kygnOd4uXg3poFkrG+oufTwUGIfcTGMeeF8JTJAUI+kaqwF7CyEPDmBuwKQqzf7yg1f5fsC5x7PR5i+TvJTCjWg1VS19+MFjaCj9ZTYId3dFgZww3OlC3AqoLVPD7EWEOWEykIQ3tskfR4L7o2nvVaqVTkcS8NN8R1oW3tVZVZRsNIzJatkf+LNs3W6wdldQjfuRjv1bCPwBBh9jviklpA+3L+uKvnul37XTZQ+2RtRlu++pCOmlXSlfDjOqRLHTh2enAXamJQ20gJ+s/gi+j9TS4Aw49QyZF65eQcgtjQDLmwbiAL1Iv8uGwxsxtamqIbbG1jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758099601; c=relaxed/relaxed;
	bh=y9JuROOv1Z8bodf9acv20lw8Oh9qlIy+EEy+myOvzeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnMMaXXy+Jn8N3kseT4El+VEbX1HjoUVRFSH688046/FhyT9i2DRMglnMIuBP7acMFCTyC/ElRungDO45YbKYEX8L/7UCUHu3DC9NrJLzjH+XVVp8sJKr6ElkJSZ8rmEHHcu9U81lYl5cftYZMSbE5OE5IQu7auVfhx+hkL73dc6XI6KGb2VC6Po8kJUc7zEa2hPsw1ef1GFu5pEub+HMk1J7qCY3kbA7fR0m8M2MtKC6EfEkhUVUEozKeoHIUMvr/3PakOlCS+th7kqwiddKydgdozGBjmoYLgxrwL+5j2cEyFZKKJYx0UDj6gy5S5Ds80fUXU/t2GLE8IltPLsKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpJZZ+3V; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tejas05@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpJZZ+3V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tejas05@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRXlf4Gwpz304h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 18:59:57 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLlspB011459;
	Wed, 17 Sep 2025 08:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=y9JuRO
	Ov1Z8bodf9acv20lw8Oh9qlIy+EEy+myOvzeU=; b=JpJZZ+3VG4bannOqaiaG1m
	4giCkik1qNm+qk8TnCDuBtYuIvhEA/Aw2aUb7xdnM5LnD50L+FbFqpI41uaZikyx
	AB0PAX3kyGZgdZQROlAKCq5yCcEOPZDbiovjzafRtbaB2lH4A5Fu9udOYmY7gj88
	8bFa7uBmMlKA63Ri9IJHeASOxw5Dt3NnfClbBWLhKPUSNzUcq9nm5RTWk+HXn8n6
	0NWOAk0Iz0Wl6wvZGkzSNkTQGQKE8sxdizP/I0h+OqZYKYKpk1Uz9Wl3mOXxXo2A
	frTp0ftM4D2aiBzDHK8PN/eTcQynDNYcCBJDksBpf/TBdHPANGxqQdnR0wzPctlg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4j2hmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 08:59:45 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58H8xi34022318;
	Wed, 17 Sep 2025 08:59:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4j2hmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 08:59:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58H5ht1k005923;
	Wed, 17 Sep 2025 08:59:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxu8jcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 08:59:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58H8xeYV32309836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Sep 2025 08:59:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E5920040;
	Wed, 17 Sep 2025 08:59:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A29AF20043;
	Wed, 17 Sep 2025 08:59:35 +0000 (GMT)
Received: from [9.124.214.27] (unknown [9.124.214.27])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Sep 2025 08:59:35 +0000 (GMT)
Message-ID: <320a93c0-befb-49df-98b4-b10906c3148d@linux.ibm.com>
Date: Wed, 17 Sep 2025 14:29:34 +0530
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
Subject: Re: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
To: Athira Rajeev <atrajeev@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
Content-Language: en-US
From: tejas05 <tejas05@linux.ibm.com>
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Qf5mvtbv c=1 sm=1 tr=0 ts=68ca7881 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=okJC4TyXnK7yox6SSLIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: RRzJMI1AgSPOucvLeTHXHgHcCmpN2-iZ
X-Proofpoint-GUID: OJxL40TGkGpp0gv7_PaOZ-te41SpRnmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX+pOzl6bObUB8
 le1eBR3NQWAIid/Kr9xyGAR9WwH4qY1TDAZ2qUhV5k5HScnsvC0ZxioNB117r2m2EAPiaelEwMF
 3HnHHmsFSA/Kb6pz20mr65kzWOHBcFUP1e/ipy4BJAb6/W/On4F0hJTPIr+K4N22TOgHHJUKlfc
 lpF/TE3/cADPeGeGKtEJRBos/JBhJkFlq7lkYZ2BICDwqDBFaLv2nVcdAaHQvCurKbvaaw/abSP
 7cmDWwcN61CJIJ6bltGkIcWeNJVUiXz3CxKbzl0BvMBdKGJD4N0YdLWPM59pBkB5eyqQZvUryiI
 QxflzG9pTrn8Ozc4O7Q5xoipOV+GTGcd/aoJHL9olw7DfqTNWO2cKkmyphL9QsV6xGMQha2LOEp
 xixCz8am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160204
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
>
> - Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
>    trace in perf.data. And patch 7 has documentation update.
>
> Infrastructure used
> ===================
>
> The VPA DTL PMU counters do not interrupt on overflow or generate any
> PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The timer
> nterval can be provided by user via sample_period field in nano seconds.
> vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
> Trace Log) contains information about dispatch/preempt, enqueue time etc.
> We directly copy the DTL buffer data as part of auxiliary buffer and it
> will be processed later. This will avoid time taken to create samples
> in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
> entries makes use of AUX support in perf infrastructure. On the tools side,
> this data is made available as PERF_RECORD_AUXTRACE records.
>
> To corelate each DTL entry with other events across CPU's, an auxtrace_queue
> is created for each CPU. Each auxtrace queue has a array/list of auxtrace buffers.
> All auxtrace queues is maintained in auxtrace heap. The queues are sorted
> based on timestamp. When the different PERF_RECORD_XX records are processed,
> compare the timestamp of perf record with timestamp of top element in the
> auxtrace heap so that DTL events can be co-related with other events
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record. Sometimes it could happen that
> one buffer is only partially processed. if the timestamp of occurrence of
> another event is more than currently processed element in the queue, it will
> move on to next perf record. So keep track of position of buffer to continue
> processing next time. Update the timestamp of the auxtrace heap with the timestamp
> of last processed entry from the auxtrace buffer.
>
> This infrastructure ensures dispatch trace log entries can be corelated
> and presented along with other events like sched.
>
> With the kernel changes;
>
>    # ls /sys/devices/vpa_dtl/
>    events  format  perf_event_mux_interval_ms  power  subsystem  type  uevent
>
> Thanks
> Athira
>
> Aboorva Devarajan (1):
>    powerpc/time: Expose boot_tb via accessor
>
> Athira Rajeev (4):
>    powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
>      capturing DTL data
>    powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
>    powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake
>      up is needed
>    powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU
>
> Kajol Jain (2):
>    powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
>    docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
>      event format entries for vpa_dtl pmu
>
>   .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
>   Documentation/arch/powerpc/index.rst          |   1 +
>   Documentation/arch/powerpc/vpa-dtl.rst        | 156 +++++
>   arch/powerpc/include/asm/time.h               |   4 +
>   arch/powerpc/kernel/time.c                    |   8 +-
>   arch/powerpc/perf/Makefile                    |   2 +-
>   arch/powerpc/perf/vpa-dtl.c                   | 596 ++++++++++++++++++
>   7 files changed, 790 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
>   create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
>   create mode 100644 arch/powerpc/perf/vpa-dtl.c
>
Hi Athira,

I have tested the above patchset on the mainline kernel [ 6.17.0-rc6], 
it is working fine. The vpa-dtl pmu is recognizable and the perf record 
report works as expected. Please add the tag below, for the entire series.

Tested-by: Tejas Manhas <tejas05@linux.ibm.com>

Thanks & Regards,

Tejas


