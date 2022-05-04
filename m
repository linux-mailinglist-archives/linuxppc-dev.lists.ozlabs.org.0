Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0AD51A144
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 15:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtdSW1m2gz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=de4hYoRL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=de4hYoRL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtdRl4qyhz3bbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 23:47:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244Da7pv020599;
 Wed, 4 May 2022 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9O4NHsy2Aflkkz1h4753zGCEqCzmFogt0f6i14qhZDc=;
 b=de4hYoRL272EDytHwrAVefJX41ttqjq78DP4gGFF4AmYbn9wzHlqvIacIcNfsReZGxuz
 7QMHk1QUnj8y/jJ5nWsj3SZj1AqmMbQYTZXuo950kFTV/FwS7TL2GHozfavSmeEFpaF3
 wN9rZswd+9XXRe1yjHsVx3JQn69xYSi+ot8ke9qqUq3MovAeMroFdPWYyXLEuN036MXp
 cUnfo7VMZeIAY8cgdKPE3Pl8XDJa6qCkTy/dKQ4lqtYUzeDbDuVwUUdpbqwPbckLqfUa
 /iTglI9wvmuUk+iezNv3cHwA7p2h7n5hhqNMrHpSyZaW580WB5Hk+6jz9TfYqOdJ41uH oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3futa6gaw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 13:47:01 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 244DdChR029234;
 Wed, 4 May 2022 13:47:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3futa6gavg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 13:47:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244DcTMA025862;
 Wed, 4 May 2022 13:46:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3frvr8wrgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 13:46:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 244DXaTg52429256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 13:33:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DE224C044;
 Wed,  4 May 2022 13:46:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D8BB4C046;
 Wed,  4 May 2022 13:46:53 +0000 (GMT)
Received: from [9.43.86.197] (unknown [9.43.86.197])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 May 2022 13:46:53 +0000 (GMT)
Message-ID: <731c0038-a14c-8c13-1a98-c07fb0298a84@linux.ibm.com>
Date: Wed, 4 May 2022 19:16:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] tools/perf: Add utility function to read
 /proc/cpuinfo for any field
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, disgoel@linux.vnet.ibm.com
References: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
 <20220428150829.30733-2-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220428150829.30733-2-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q9NEUHSnl_P29iHQUFxpnqXOWTGc9jOR
X-Proofpoint-GUID: j6y5ID5sGO_H27CZJ-JvoY2so_6Ukwnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040086
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/28/22 20:38, Athira Rajeev wrote:
> /proc/cpuinfo provides information about type of processor, number
> of CPU's etc. Reading /proc/cpuinfo file outputs useful information
> by field name like cpu, platform, model (depending on architecture)
> and its value separated by colon.
> 
> Add new utility function "cpuinfo_field" in "util/header.c" which
> accepts field name as input string to search in /proc/cpuinfo content.
> This returns the first matching value as resulting string. Example,
> calling the function "cpuinfo_field(platform)" in powerpc returns
> the platform value. This can be used to fetch processor information
> from "cpuinfo" by other utilities/testcases.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/header.c | 54 ++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/header.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> index a27132e5a5ef..0c8dfd0c1e78 100644
> --- a/tools/perf/util/header.c
> +++ b/tools/perf/util/header.c
> @@ -983,6 +983,60 @@ static int write_dir_format(struct feat_fd *ff,
>  	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
>  }
>  
> +/*
> + * Return entry from /proc/cpuinfo
> + * indicated by "search" parameter.
> + */
> +char *cpuinfo_field(const char *search)
> +{
> +	FILE *file;
> +	char *buf = NULL;
> +	char *copy_buf = NULL, *p;
> +	size_t len = 0;
> +	int ret = -1;
> +
> +	if (!search)
> +		return NULL;
> +
> +	file = fopen("/proc/cpuinfo", "r");
> +	if (!file)
> +		return NULL;
> +
> +	while (getline(&buf, &len, file) > 0) {
> +		ret = strncmp(buf, search, strlen(search));
> +		if (!ret)
> +			break;
Hi Athira,
	Do we need ret variable. Since we will come out of the loop only when
we reach EOF.

> +	}
> +
> +	if (ret)
> +		goto done;
> +
> +	/*
> +	 * Trim the new line and separate
> +	 * value for search field from ":"
> +	 * in cpuinfo line output.
> +	 * Example output line:
> +	 * platform : <value>
> +	 */
> +	copy_buf = buf;
> +	p = strchr(copy_buf, ':');
> +	if (p && *(p+1) == ' ' && *(p+2))


Can you try using strim instead to remove whitespaces. This function
will remove leading and trailing whitespaces from the string.

> +		copy_buf = p + 2;
> +	p = strchr(copy_buf, '\n');

do we need to replace `\n` here ?


> +	if (p)
> +		*p = '\0';
> +
> +	/* Copy the filtered string to buf */
> +	strcpy(buf, copy_buf)

You are initializing buf to NULL. So do we need to do fclose and return
buf separately here? Can you move free(buf) in above condition and reuse
`done` code.
> +
> +	fclose(file);
> +	return buf;> +
> +done:
> +	free(buf);
> +	fclose(file);
> +	return NULL;
> +}
>  /*
>   * Check whether a CPU is online
>   *
> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
> index 0eb4bc29a5a4..b0f754364bd4 100644
> --- a/tools/perf/util/header.h
> +++ b/tools/perf/util/header.h
> @@ -166,4 +166,5 @@ int get_cpuid(char *buffer, size_t sz);
>  
>  char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
>  int strcmp_cpuid_str(const char *s1, const char *s2);
> +char *cpuinfo_field(const char *search);
>  #endif /* __PERF_HEADER_H */
