Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E5C329674
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 07:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqSG764vLz3d2r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 17:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EKHeYm21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EKHeYm21; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqNgq3nx8z30Gr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 15:00:06 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1223XXmV069492; Mon, 1 Mar 2021 22:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=zEHHXIfNJ4uWZaicaZC8dpZv2ZIayL7zagGW47DXYIw=;
 b=EKHeYm21FtF5D7NjZBwPvoTC4lP/93M+2yoUjGrTL3fdj866CnvdcFIk4HbltPcHkivq
 X43ejFxz2nJ5KVEOHkMjuK6RxOQ2VI+C2aF13glMEpeVl9QtID/EmchlgQbI1YPOtvkk
 6NQW3WJOnLTaX8txX5PLryKczY4EDcOfErwk9VkS03W1Kw6JP+Uy1ABvfMTGs4BL47LR
 4xKVK3156WWdoXFrfoVshJhLCFsv3McDaRwVC1JsrRuDo+rcVewaCnqEfEXDedDwpk5l
 +dKMX8jbQp6MeWtLrFoP2eG/0SkO/njXejhMNgNw0hXjcd9lXDlGMl1RSNTICOX6Lp44 vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371bpptx5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 22:59:52 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1223v8mo018067;
 Tue, 2 Mar 2021 03:59:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3712fmgf17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 03:59:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1223xWF028246444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 03:59:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A331DA405B;
 Tue,  2 Mar 2021 03:59:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B7F2A4054;
 Tue,  2 Mar 2021 03:59:43 +0000 (GMT)
Received: from [9.124.209.77] (unknown [9.124.209.77])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Mar 2021 03:59:43 +0000 (GMT)
Subject: Re: [PATCH] perf bench numa: Fix the condition checks for max number
 of numa nodes
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://6/
In-Reply-To: <20210226085827.GF2028034@linux.vnet.ibm.com>
X-Apple-Windows-Friendly: 1
Date: Tue, 2 Mar 2021 09:14:57 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AD72639-43C5-4C2C-A2DC-3186A50A5D0A@linux.vnet.ibm.com>
References: <1614271802-1503-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210226085827.GF2028034@linux.vnet.ibm.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_15:2021-03-01,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020025
X-Mailman-Approved-At: Tue, 02 Mar 2021 17:40:50 +1100
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
Cc: ravi.bangoria@linux.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
26-Feb-2021, at 2:28 PM, Srikar Dronamraju =
&lt;srikar@linux.vnet.ibm.com&gt; wrote:<br><br>* Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt; [2021-02-25 =
11:50:02]:<br><br><blockquote type=3D"cite">In systems having higher =
node numbers available like node<br>255, perf numa bench will fail with =
SIGABORT.<br><br>&lt;&lt;&gt;&gt;<br>perf: bench/numa.c:1416: init: =
Assertion `!(g-&gt;p.nr_nodes &gt; 64 || g-&gt;p.nr_nodes &lt; 0)' =
failed.<br>Aborted (core =
dumped)<br>&lt;&lt;&gt;&gt;<br><br></blockquote><br>Looks good to =
me.<br><br>Reviewed-by: Srikar Dronamraju =
&lt;srikar@linux.vnet.ibm.com&gt;<br></blockquote><br>Thanks Srikar for =
reviewing the patch.<br><br>Athira.<br><blockquote type=3D"cite"><br>-- =
<br>Thanks and Regards<br>Srikar =
Dronamraju<br></blockquote><br></div></body></html>=
