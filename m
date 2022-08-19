Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72564599455
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 07:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M88w02TtJz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 15:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p3fmdjIc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p3fmdjIc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M88JG608Lz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 14:42:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J4XiHd030191;
	Fri, 19 Aug 2022 04:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=m9GWztfS44BT2wPFQ4IWhavq6+lO4KNLXc37dNfEmyg=;
 b=p3fmdjIcPPbyasQdv+UYIYgKYKiAFR0d+PkE6cnz50mX6fkMZy2CQEM3REhvhOVZpOdm
 YHA/O+spw2Ny+ACtRg2WcnTUqYAg5cE4ebpM1ySFwtFbqsN9eLPZyf4vqUvo46jsXxBn
 9Ao2aFKYHb4TZTm4khcfx8WE3LxhuDlfnpk8RyXrdu21Fe4WUXFxeA8WStZCUHp9ocJK
 lgsaGxOnrhE5hWRaCrP+GJJ2mBMrYqVSqafNmL5QSj3POvMJuHnVmwVg0WplcVfHR5eP
 wPZQFfIDXOdlceJgtOwwcwkqvf/rG7f/MmtLkAFJkMOlstXNKEi1zU+D2WQ/9NEwbG0L pg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j23kr8qmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 04:42:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J4aEP3029139;
	Fri, 19 Aug 2022 04:42:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3hx3k8w13c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 04:42:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J4dpm931392028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 04:39:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F1F11C050;
	Fri, 19 Aug 2022 04:42:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BEC511C04A;
	Fri, 19 Aug 2022 04:42:39 +0000 (GMT)
Received: from [9.43.36.148] (unknown [9.43.36.148])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 04:42:39 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------qYfO0qF79ARr9916UXjkernb"
Message-ID: <f70dfa03-1f5b-d738-ea75-cad5f5f97a43@linux.ibm.com>
Date: Fri, 19 Aug 2022 10:12:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [6.0-rc1] Kernel crash while running MCE tests
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Sachin Sant
 <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
 <87wnb7v2b3.fsf@mpe.ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <87wnb7v2b3.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tF9j3Z8rpBcX80wtFHiDIP2sl7UNjpHW
X-Proofpoint-ORIG-GUID: tF9j3Z8rpBcX80wtFHiDIP2sl7UNjpHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190018
X-Mailman-Approved-At: Fri, 19 Aug 2022 15:09:51 +1000
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------qYfO0qF79ARr9916UXjkernb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/22 11:28, Michael Ellerman wrote:

> Sachin Sant<sachinp@linux.ibm.com>  writes:
>> Following crash is seen while running powerpc/mce subtest on
>> a Power10 LPAR.
>>
>> 1..1
>> # selftests: powerpc/mce: inject-ra-err
>> [  155.240591] BUG: Unable to handle kernel data access on read at 0xc00e00022d55b503
>> [  155.240618] Faulting instruction address: 0xc0000000006f1f0c
>> [  155.240627] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  155.240633] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>> [  155.240642] Modules linked in: dm_mod mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set nf_tables nfnetlink sunrpc binfmt_misc pseries_rng drm drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sr_mod crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp xts vmx_crypto fuse
>> [  155.240750] CPU: 4 PID: 3645 Comm: inject-ra-err Not tainted 6.0.0-rc1 #2
>> [  155.240761] NIP:  c0000000006f1f0c LR: c0000000000630d0 CTR: 0000000000000000
>> [  155.240768] REGS: c0000000ff887890 TRAP: 0300   Not tainted  (6.0.0-rc1)
>> [  155.240776] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  XER: 00000000
>                                          ^^^^^^^^^^^^^
>                                          MMU is off, aka. real mode.
>
>> [  155.240792] CFAR: c0000000000630cc DAR: c00e00022d55b503 DSISR: 40000000 IRQMASK: 3
>> [  155.240792] GPR00: c0000000000630d0 c0000000ff887b30 c0000000044afe00 c00000116aada818
>> [  155.240792] GPR04: 0000000000004d43 0000000000000008 c0000000000630d0 004d424900000000
>> [  155.240792] GPR08: 0000000000000001 180000022d55b503 a80e000000000000 0000000003000048
>> [  155.240792] GPR12: 0000000000000000 c0000000ffffb700 0000000000000000 0000000000000000
>> [  155.240792] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [  155.240792] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000010000b30
>> [  155.240792] GPR24: 00007fff8dad0000 00007fff8dacf6d8 00007fffd1551e98 000000001001fce8
>> [  155.240792] GPR28: c00000116aada888 c00000116aada800 0000000000004d43 c00000116aada818
>> [  155.240885] NIP [c0000000006f1f0c] __asan_load2+0x5c/0xe0
>> [  155.240898] LR [c0000000000630d0] pseries_errorlog_id+0x20/0x40
>> [  155.240910] Call Trace:
>> [  155.240914] [c0000000ff887b50] [c0000000000630d0] pseries_errorlog_id+0x20/0x40
>> [  155.240925] [c0000000ff887b80] [c0000000015595c8] get_pseries_errorlog+0xa8/0x110
>   
> get_pseries_errorlog() is marked noinstr.
>
> And pseries_errorlog_id() is:
>
> static
> inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
> {
> 	return be16_to_cpu(sect->id);
> }
>
> So I guess the compiler has decided not to inline it (why?!), and it is
> not marked noinstr, so it gets KASAN instrumentation which crashes in
> real mode.
>
> We'll have to make sure everything get_pseries_errorlog() is either
> forced inline, or marked noinstr.

Making the following functions always_inline and noinstr is fixing the issue.
__always_inline pseries_errorlog_id()
__always_inline pseries_errorlog_length()
__always_inline do_enter_rtas()
__always_inline srr_regs_clobbered()
noinstr va_rtas_call_unlocked()

Shall I post the patch?

--------------qYfO0qF79ARr9916UXjkernb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 8/17/22 11:28, Michael Ellerman wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:87wnb7v2b3.fsf@mpe.ellerman.id.au">
      <pre class="moz-quote-pre" wrap="">Sachin Sant <a class="moz-txt-link-rfc2396E" href="mailto:sachinp@linux.ibm.com">&lt;sachinp@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Following crash is seen while running powerpc/mce subtest on
a Power10 LPAR. 

1..1
# selftests: powerpc/mce: inject-ra-err
[  155.240591] BUG: Unable to handle kernel data access on read at 0xc00e00022d55b503
[  155.240618] Faulting instruction address: 0xc0000000006f1f0c
[  155.240627] Oops: Kernel access of bad area, sig: 11 [#1]
[  155.240633] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[  155.240642] Modules linked in: dm_mod mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set nf_tables nfnetlink sunrpc binfmt_misc pseries_rng drm drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sr_mod crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp xts vmx_crypto fuse
[  155.240750] CPU: 4 PID: 3645 Comm: inject-ra-err Not tainted 6.0.0-rc1 #2
[  155.240761] NIP:  c0000000006f1f0c LR: c0000000000630d0 CTR: 0000000000000000
[  155.240768] REGS: c0000000ff887890 TRAP: 0300   Not tainted  (6.0.0-rc1)
[  155.240776] MSR:  8000000000001003 &lt;SF,ME,RI,LE&gt;  CR: 48002828  XER: 00000000
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">                                        ^^^^^^^^^^^^^
                                        MMU is off, aka. real mode.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[  155.240792] CFAR: c0000000000630cc DAR: c00e00022d55b503 DSISR: 40000000 IRQMASK: 3 
[  155.240792] GPR00: c0000000000630d0 c0000000ff887b30 c0000000044afe00 c00000116aada818 
[  155.240792] GPR04: 0000000000004d43 0000000000000008 c0000000000630d0 004d424900000000 
[  155.240792] GPR08: 0000000000000001 180000022d55b503 a80e000000000000 0000000003000048 
[  155.240792] GPR12: 0000000000000000 c0000000ffffb700 0000000000000000 0000000000000000 
[  155.240792] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
[  155.240792] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000010000b30 
[  155.240792] GPR24: 00007fff8dad0000 00007fff8dacf6d8 00007fffd1551e98 000000001001fce8 
[  155.240792] GPR28: c00000116aada888 c00000116aada800 0000000000004d43 c00000116aada818 
[  155.240885] NIP [c0000000006f1f0c] __asan_load2+0x5c/0xe0
[  155.240898] LR [c0000000000630d0] pseries_errorlog_id+0x20/0x40
[  155.240910] Call Trace:
[  155.240914] [c0000000ff887b50] [c0000000000630d0] pseries_errorlog_id+0x20/0x40
[  155.240925] [c0000000ff887b80] [c0000000015595c8] get_pseries_errorlog+0xa8/0x110
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""> 
get_pseries_errorlog() is marked noinstr.

And pseries_errorlog_id() is:

static
inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
{
	return be16_to_cpu(sect-&gt;id);
}

So I guess the compiler has decided not to inline it (why?!), and it is
not marked noinstr, so it gets KASAN instrumentation which crashes in
real mode.

We'll have to make sure everything get_pseries_errorlog() is either
forced inline, or marked noinstr.
</pre>
    </blockquote>
    <pre>Making the following functions always_inline and noinstr is fixing the issue.
__always_inline pseries_errorlog_id()
__always_inline pseries_errorlog_length()
__always_inline do_enter_rtas()
__always_inline srr_regs_clobbered()
noinstr va_rtas_call_unlocked()

Shall I post the patch?
</pre>
  </body>
</html>

--------------qYfO0qF79ARr9916UXjkernb--

