Return-Path: <linuxppc-dev+bounces-12206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B172EB57646
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLrd1QHZz3dHD;
	Mon, 15 Sep 2025 20:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932209;
	cv=none; b=FHadiGmv7emXfIjBWsfjCsWhFeEvkgyR6A7fkUKt+KIFN0IvejA1V8Boe7BxtNgqBt9rPfSBFBzaIqq3qv1JJ4EiUbodRmBoIkqZ+uw96ufoHjGldRxz8dF/MteRD3vE2aqGql7W6hpTCENpuhNos8i/z0olkDYmn/MavcDtaLLaVeDjhAfYsLMH/Ea2t3p1yXR/gNIPkxlCShwNO/IWu1kEmpqiCh3tQTH20jaQq6uU0fMwlOAOcVigQvRDdsht9+cvmvisbuFruocm0x5uQH2Cppj4ZMqPqz3ci+CgFRmx4HG89rvfsdibPLu7nPXwJbu7RhNEfnRpyVdejRuexg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932209; c=relaxed/relaxed;
	bh=sCfwyB2Scl5oHZwD1rUg0V0mD8oRceJIaH76Sz25eJc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fiEPRSWyS8PS6YlRE+P+tlZanMARuDnqtphTXC9t472GB0f/J9RbnkCPrFZyfXKkw9k6RFmjzL/2PNW9+1o+9O6RbQbFvfVhgqp4Y+vcTHxHRR16ro6GUGCvRGEX9g6KFTQTZI3yHpb5igQ3vtWH1hF5nrnsQir7MT5uUmnvykavfMV4uNMGh5XaSF87zKoQWiYBWuRByoK+5ElNb/cUAI3JZ834RXBXnWwk/Wg7Grzg3LB8hW1DjLj8lt9RH7S5OTGGhMgAHFMWoSFVpDeEOxsmd0R+tCfRtT9HXr0vXU66RAU49TbDvz8yJhcrpUozGIauGWpOXcUrvC/NUEJWCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4dJtero; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A4dJtero;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLrc0KWlz3dDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:07 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3PPIM023282;
	Mon, 15 Sep 2025 10:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=sCfwyB2Scl5oHZwD1rUg0V0mD8oRceJIaH76Sz25e
	Jc=; b=A4dJteroIpLXJpVb5QUTQTJOduhpF5uoCthQSqbNCUHCP5n4zgZHlv1lO
	mI7NaZTL5gti/T/ib0fNBxzmaJj4bsrmA1KHGuKKZMcUxkaCf6Vv0MLoWjI39M/K
	dgPrIJ/ePFq1Med3CcJdmf5M3dIxDmt+FR0Mv/AwjXvakjp43MLHye2wG/uWJRgX
	VpM+UExAimW16m8qZPijTtV7DwpShay9JtsWno6iGvGwoaMVd7P67FXwLVXLfFcl
	L2ehR9lyYPj778ve7f4jRuJa3aEJdmA8dMLbo7d1UckXk3kUhLpTWY6VxvGY6LKc
	qjweQamBcU7wLGAGZPdspwE2sj2Jw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnhw63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:03 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FAFjuH008131;
	Mon, 15 Sep 2025 10:30:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnhw60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F91SU3009382;
	Mon, 15 Sep 2025 10:30:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn35m0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FATwIb56361452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:29:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 729852004D;
	Mon, 15 Sep 2025 10:29:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1738320040;
	Mon, 15 Sep 2025 10:29:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:29:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
Date: Mon, 15 Sep 2025 15:59:40 +0530
Message-Id: <20250915102947.26681-1-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wuGXb9l3djs3v6l3yx3egFB6P3MKpv7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX2sv8s8dsaMOv
 YnFpe8xjrB79RTvlpa9mOjvH8mn2dVnnWFcDUEnEtNyoQINg/VjtPnoHBwrRK58P7A5hIpvxg76
 nyo5Ypv0Zbdn8Z0Gs0dpAQ7jPRzxTAOD67zwZoPEOxBU/CTaroE7ob22/M11LBiMhP2eCfzB6oM
 bNtEfzjTlmSmNHT0Gisl2McDShSYLzxOPG3M9M6tbhXfdUggMMr0A5Z1p4IRWQtVuzg80+dRw5j
 vHWeuJbz+XCR2S5vtF1Wm+LZ4CFC74MLafLMQzo+KOydHYZ2sldxiA8rq+44BP4Mcn7RFfS4EM5
 TSjGwIL8gfOmP/1A4AyYj1E5dw6b5iBUoMJkmH/sPT/tTAOIzizZR09jKKSrZID0ClKA7vHlOng
 d1E5CMbX
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c7eaab cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=sGukl9S6aO4tzaH1yDAA:9
X-Proofpoint-GUID: 4PdI1S2RTrA2ADA9a497tGYkQ5If3rSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The pseries Shared Processor Logical Partition(SPLPAR) machines can
retrieve a log of dispatch and preempt events from the hypervisor
using data from Disptach Trace Log(DTL) buffer. With this information,
user can retrieve when and why each dispatch & preempt has occurred.
The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
via perf.

- Patches 1 to 6 has powerpc PMU driver code changes to capture DTL
  trace in perf.data. And patch 7 has documentation update.

Infrastructure used
===================

The VPA DTL PMU counters do not interrupt on overflow or generate any
PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The timer
nterval can be provided by user via sample_period field in nano seconds.
vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
Trace Log) contains information about dispatch/preempt, enqueue time etc.
We directly copy the DTL buffer data as part of auxiliary buffer and it
will be processed later. This will avoid time taken to create samples
in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
entries makes use of AUX support in perf infrastructure. On the tools side,
this data is made available as PERF_RECORD_AUXTRACE records.

To corelate each DTL entry with other events across CPU's, an auxtrace_queue
is created for each CPU. Each auxtrace queue has a array/list of auxtrace buffers.
All auxtrace queues is maintained in auxtrace heap. The queues are sorted
based on timestamp. When the different PERF_RECORD_XX records are processed,
compare the timestamp of perf record with timestamp of top element in the
auxtrace heap so that DTL events can be co-related with other events
Process the auxtrace queue if the timestamp of element from heap is
lower than timestamp from entry in perf record. Sometimes it could happen that
one buffer is only partially processed. if the timestamp of occurrence of
another event is more than currently processed element in the queue, it will
move on to next perf record. So keep track of position of buffer to continue
processing next time. Update the timestamp of the auxtrace heap with the timestamp
of last processed entry from the auxtrace buffer.

This infrastructure ensures dispatch trace log entries can be corelated
and presented along with other events like sched.

With the kernel changes;

  # ls /sys/devices/vpa_dtl/
  events  format  perf_event_mux_interval_ms  power  subsystem  type  uevent

Thanks
Athira

Aboorva Devarajan (1):
  powerpc/time: Expose boot_tb via accessor

Athira Rajeev (4):
  powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for
    capturing DTL data
  powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
  powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake
    up is needed
  powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU

Kajol Jain (2):
  powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
  docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs
    event format entries for vpa_dtl pmu

 .../sysfs-bus-event_source-devices-vpa-dtl    |  25 +
 Documentation/arch/powerpc/index.rst          |   1 +
 Documentation/arch/powerpc/vpa-dtl.rst        | 156 +++++
 arch/powerpc/include/asm/time.h               |   4 +
 arch/powerpc/kernel/time.c                    |   8 +-
 arch/powerpc/perf/Makefile                    |   2 +-
 arch/powerpc/perf/vpa-dtl.c                   | 596 ++++++++++++++++++
 7 files changed, 790 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
 create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
 create mode 100644 arch/powerpc/perf/vpa-dtl.c

-- 
2.47.1


