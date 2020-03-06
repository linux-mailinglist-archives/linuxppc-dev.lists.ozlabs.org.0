Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731717C56A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 19:27:11 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yx0s0d2DzDrBy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 05:27:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ywyz1jnXzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 05:25:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Ywyy69txz9BVN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 05:25:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Ywyy5bLmz9sPJ; Sat,  7 Mar 2020 05:25:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Ywyx2CGFz9sPR;
 Sat,  7 Mar 2020 05:25:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026ILYqx033154; Fri, 6 Mar 2020 13:25:21 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ykdu65agu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 13:25:21 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026IFIa6006383;
 Fri, 6 Mar 2020 18:25:20 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2yffk7nd4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 18:25:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026IPJ6b6292166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 18:25:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66EEBC6059;
 Fri,  6 Mar 2020 18:25:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4856DC6062;
 Fri,  6 Mar 2020 18:25:19 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 18:25:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Add a test of sigreturn vs VDSO
In-Reply-To: <20200304110402.6038-1-mpe@ellerman.id.au>
References: <20200304110402.6038-1-mpe@ellerman.id.au>
Date: Fri, 06 Mar 2020 12:25:18 -0600
Message-ID: <87mu8tjq7l.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_06:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 adultscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=616
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060115
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> +static int search_proc_maps(char *needle, unsigned long *low, unsigned long *high)

                               ^^ const?
                               
> +{
> +	unsigned long start, end;
> +	static char buf[4096];
> +	char name[128];
> +	FILE *f;
> +	int rc = -1;
> +
> +	f = fopen("/proc/self/maps", "r");
> +	if (!f) {
> +		perror("fopen");
> +		return -1;
> +	}
> +
> +	while (fgets(buf, sizeof(buf), f)) {
> +		rc = sscanf(buf, "%lx-%lx %*c%*c%*c%*c %*x %*d:%*d %*d %127s\n",
> +			    &start, &end, name);

I suspect it doesn't matter in practice for this particular test, but
since this looks like a generally useful function that could gain users
in the future: does this spuriously fail if the matching line straddles
a 4096-byte boundary? Maybe fscanf(3) should be used instead?


> +		if (rc == 2)
> +			continue;
> +
> +		if (rc != 3) {
> +			printf("sscanf errored\n");
> +			rc = -1;
> +			break;
> +		}
> +
> +		if (strstr(name, needle)) {
> +			*low = start;
> +			*high = end - 1;
> +			rc = 0;
> +			break;
> +		}
> +	}
> +
> +	fclose(f);
> +
> +	return rc;
> +}
> +
> +static volatile sig_atomic_t took_signal = 0;
> +
> +static void sigusr1_handler(int sig)
> +{
> +	took_signal++;
> +}
> +
> +int test_sigreturn_vdso(void)
> +{
> +	unsigned long low, high, size;
> +	struct sigaction act;
> +	char *p;
> +
> +	act.sa_handler = sigusr1_handler;
> +	act.sa_flags = 0;
> +	sigemptyset(&act.sa_mask);
> +
> +	assert(sigaction(SIGUSR1, &act, NULL) == 0);
> +
> +	// Confirm the VDSO is mapped, and work out where it is
> +	assert(search_proc_maps("[vdso]", &low, &high) == 0);
> +	size = high - low + 1;
> +	printf("VDSO is at 0x%lx-0x%lx (%lu bytes)\n", low, high, size);
> +
> +	kill(getpid(), SIGUSR1);
> +	assert(took_signal == 1);
> +	printf("Signal delivered OK with VDSO mapped\n");

I haven't looked at the test harness in detail but this should be
reliable if the program is a single thread - lgtm.
