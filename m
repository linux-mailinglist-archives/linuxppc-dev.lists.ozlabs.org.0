Return-Path: <linuxppc-dev+bounces-12532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44601B9496E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 08:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cW9NK5gkJz3cYP;
	Tue, 23 Sep 2025 16:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758609649;
	cv=none; b=IkBZ64/w27AUM9pruXuqdpsI5QgwBTyugfgE9MhC/OoszFEzMUZDH3g83HgW/3a68Nlfmclr2WQbaF3wCod5usItHN5dROmk0mw1WpLLSX44oHpvHKmwTEc/6INqvS/ZwPYKQhtTwXLs6OfJwZbXP4Q2UHhzh9TmRRZcQJi3L7Sn1YHeSbhXCwpEZ/on8+G3S2dwTPNzWSWO0XjBTm3RG75/GdVDV0Z59MH3dcU/LPS6/m+DvybikqZ3OluV7Yk/zQu/WNVZaKkJr3XCaMm2UW3lpE+RYHP9qZXngCt3TTsYCUzaEUPoFkUFuPlfJWjcAMw4qS67GhupIb5HE0denA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758609649; c=relaxed/relaxed;
	bh=8L8Zk3aGDumtFBeuituLPxeAoM1QdnKL7ctml6ul9tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7aYNGX2xDq/Z+ysEjus9G2kHJufy+WPx9L7ig60nqhGcftEKbGvGm/L8PnOp64h7YqtftkruOL+bcREhTSTcSSGWd15Pn7wGv9A2mh5dt1VicTWkbVRytYfeNAlVxMM2O9Vrd22AsI0fmbalVDjSg2okTvyYt0yOwjoXFZh8L9SKvvpDcwupyogTqcJxqf7JvGr2nOTk8foxfW/CxBaSUPMSI2P8UJc4RXMOgy/aFfEOQ46H6kM4X6vg/8lUyoMas11AQi2j31B6do5eMizonTEtiYskF7TWIkH304luviFIBVLZ5lNLamUqAEeRZgu2QS03qCnYcwRoR3DYHVVww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p9NvMc6z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p9NvMc6z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cW9NJ5Wn5z2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 16:40:48 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIoLLC025249;
	Tue, 23 Sep 2025 06:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8L8Zk3
	aGDumtFBeuituLPxeAoM1QdnKL7ctml6ul9tU=; b=p9NvMc6zoXsm4613GT3vzr
	hhz9qBZPT0Qw68betQcaNu5jwh6EfEm871Fg9P6Fwu/FKSTAFEjLTjmHFQVxX6YF
	v2sfJAcCBJdBK/EmewSf8ohXxtq13VQk4UP7rujN+1FDxJHgBBB0e8Giv7CgiMgD
	DRQsM3iKbTwTlmHxoHHo5APmuumSp6UmLTN6ImbE2GfUJU+kqxzZsvM+cu+v5A4F
	bNupzaHpYRjXWj9toZ3ia+YHe4P+T+jp1p5EtaoQo/atXQ3MvYJdjSWbbhCO8vUh
	gkHCGjBsmQEhdawZ/ecBvJ3QO8PZlw4sFU6DJ06/isvzTpwpIipPzDeUsnpg4TZA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ky5y8ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 06:40:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58N6ecUB009006;
	Tue, 23 Sep 2025 06:40:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ky5y8eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 06:40:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58N5OiSw031150;
	Tue, 23 Sep 2025 06:40:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49b9vd2wyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 06:40:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58N6eXWG37945838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Sep 2025 06:40:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE6C6208BE;
	Tue, 23 Sep 2025 06:22:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D23BE2089A;
	Tue, 23 Sep 2025 06:22:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.94.138])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Sep 2025 06:22:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Athira Rajeev <atrajeev@linux.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: Re: [PATCH V3 0/7] Add interface to expose vpa dtl counters via
Date: Tue, 23 Sep 2025 11:52:37 +0530
Message-ID: <175860852521.1640363.14331907385336078326.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EJSqHDN4COH8cOMY2DW7lTnBe9jD98Db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMCBTYWx0ZWRfXyQ1rBcwhq3m2
 WtE+Cij/2bkgeYtw0T93nRrMI+kHfFHR2dWvVbOz9GfFOZTeR0nTwsj1QLtkU5D7a7BcwnnxG56
 AVDHD7HZ6ovpflC3DDkFdUbQFUoQxJuJHAnRJNSxkfffrYeqVSihZMGuc9L98ZE6EyhzQ9Zivov
 ebKJpg49EIL/g3lXPMUDbU0xYYz41Dj3uHmrprGYF+bEIuW4WJKLc5mtgH7mWtC2Ev73VjN6ArN
 rkIWwxUOHdY7ETU9K5VJSEPb8Hykt+XjdTeGpTFfSi5hAN3kfQpOhEIszyqGZq/q9PgAPDEfG4T
 z/C/MeRFrKNcfKeIEcT3I1XYc/BNGdLo9mRrlR9zHW7VBPAkmzlU6+s3m+VLGsGzxnRfNDhmAyq
 ZMLdd26K
X-Authority-Analysis: v=2.4 cv=XYGJzJ55 c=1 sm=1 tr=0 ts=68d240e7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=mKQpEHmZPOLzfWqt6YMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: r4OjiLHTGHZ3fbG3lstIKY4jTNmv_hVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 15 Sep 2025 15:59:40 +0530, Athira Rajeev wrote:
> The pseries Shared Processor Logical Partition(SPLPAR) machines can
> retrieve a log of dispatch and preempt events from the hypervisor
> using data from Disptach Trace Log(DTL) buffer. With this information,
> user can retrieve when and why each dispatch & preempt has occurred.
> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
> via perf.
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/time: Expose boot_tb via accessor
      https://git.kernel.org/powerpc/c/2dc019ca39347f76891d34a992b67258078aa45d
[2/7] powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
      https://git.kernel.org/powerpc/c/4708fba19adee9ba14ef28af6face4ab043d9cd6
[3/7] docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu
      https://git.kernel.org/powerpc/c/6f2c65680c336a274b69b1fdcbfa2eeb8159bee8
[4/7] powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for capturing DTL data
      https://git.kernel.org/powerpc/c/5d75aed84d3b6d25c7c4bb4a212b14fae4d1020b
[5/7] powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
      https://git.kernel.org/powerpc/c/2de8b6dd5ae72eb6fb7c756a3f2c131171fe3b8b
[6/7] powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake up is needed
      https://git.kernel.org/powerpc/c/b5e71cafa02d4e673639a3bd4c03d84db5dd8b8a
[7/7] powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU
      https://git.kernel.org/powerpc/c/4a774b39e68fac7d6c7c9cffeb6a4ea4b6dc8b41

Thanks

