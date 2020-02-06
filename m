Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE5154B05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 19:24:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D6Jl4nFQzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 05:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.26.198;
 helo=usfb19pa35.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=J3b3S9xK; 
 dkim-atps=neutral
Received: from USFB19PA35.eemsg.mail.mil (USFB19PA35.eemsg.mail.mil
 [214.24.26.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D6H22hh9zDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 05:22:34 +1100 (AEDT)
X-EEMSG-check-017: 53781252|USFB19PA35_ESA_OUT05.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,410,1574121600"; d="scan'208";a="53781252"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by USFB19PA35.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 Feb 2020 18:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1581013348; x=1612549348;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DztAPQ93eRcJAbhp841pIFS9gTvcTatSHOWa1u0UGrs=;
 b=J3b3S9xKjIqz3Jh9y9RMlZXStiG9gW1gjj3A4eIW+VTdvHOPwvNal+R0
 P2gUqJkOscC7xWHzk8Z19cXGnF68g1OnhTJD0Kd43p+VEGJdBNg8PO1FO
 IMwKNiJCLKcwJsGiE+zSpeXk/JlsnGVs70xi9RWP4tlFBoO3acvZkg//R
 18J60Onfc9bGj2snEYTdVl25xUZVQ7eodMy+Uy0wwWrCa5dc62LU4xzN1
 kjU4d2sw6fjZ7PaguNKH9zHh3/cNiVGEW5NQBudHaksQWqq8Z3rs3DsqC
 mS+VzE4Y5t4HOo3Im89byRVDu/t7YWjU/mgbm3aF+jPkerDjDdF49T9sR A==;
X-IronPort-AV: E=Sophos;i="5.70,410,1574121600"; d="scan'208";a="38772825"
IronPort-PHdr: =?us-ascii?q?9a23=3A5QlaRBQOpU7ljCg2Jv4l02NbAdpsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa64YxWAt8tkgFKBZ4jH8fUM07OQ7/m8HzFbqs/Y6DhCKMUKC0?=
 =?us-ascii?q?Zez51O3kQJO42sMQXDNvnkbig3ToxpdWRO2DWFC3VTA9v0fFbIo3e/vnY4Ex?=
 =?us-ascii?q?T7MhdpdKyuQtaBx8u42Pqv9JLNfg5GmCSyYa9oLBWxsA7dqtQajZFtJ6osxR?=
 =?us-ascii?q?bFuHtFdupZyW91OF6fgwv36sOs8JJ+6ShdtO8t+sBaXanmY6g0SKFTASg7PW?=
 =?us-ascii?q?wy+MDlrwTIQxGV5nsbXGUWkx5IDBbA4RrnQJr/sTb0u/Rk1iWCMsL4Ub47WT?=
 =?us-ascii?q?K576d2UxDokzsINyQ48G7MlMN9ir9QrQ+7qBx+x47UZ5yVNOZ7c6jAc94WWX?=
 =?us-ascii?q?ZNU8BMXCFaHIiyc5UAAPYAPeZAronyuV0OrQelBQKxAO/j0yJEimPq0aE/1e?=
 =?us-ascii?q?kuHxvG3Ag9FNwQtnraosj+OKMLXeyryKTEyDPOZO5U1zjg8ojFag0vr++CXb?=
 =?us-ascii?q?xwcsTfx0cgGAzHgVqMpoLoJC+V2+YXvmSH8+ZtW+Cihmg6oA9xuDivwcIsh5?=
 =?us-ascii?q?HUiIIJ1F/E7SV5z5gzJdalVUB7ZMSrEJ9Uty6EN4p9X8QvQ3p1tyYh0bAGpZ?=
 =?us-ascii?q?66czQKyJQg3RLfbeeHfJKS7hLsU+aRPy51iXR4c7yxgBay9FKvyuz6VsSs01?=
 =?us-ascii?q?ZFsDBFkt/SuXAJzRDT7dKHSvRl8kekwzmP0QLe5vtDIUAumqrWLYMqzL0olp?=
 =?us-ascii?q?cLrEjOESD7lF/2gaOLbEko5Oel5/r9brn7oJKXKpV6hRvkMqs0n8yyGeE4Mg?=
 =?us-ascii?q?8TUGeF4em8z7jj/VHhQLVNk/02jrHVsJDEKsQfoa60GxNV3Zw56xa+Ejemy8?=
 =?us-ascii?q?4UnXgBLFJLfxKHlJbmNE3ULPDkDfawn1SskDBxy/DAIrLhGYnCImLGkLfgeb?=
 =?us-ascii?q?Zx809cyAwtwtBD/59YF74MLf3pVkLxqdDUFAE1PgOqz+r9FdlxzoYeVniOAq?=
 =?us-ascii?q?+dPqPSq1iI5uc3LumXeYAVoy3wK+Ql5vHyjX85nkURfa+y3ZQNcny4EfNmI1?=
 =?us-ascii?q?uBbXr2ntgBCXsKvhY5TOHyklKCVSBcZnmsUKM8/D00E5+mAprZSYCrg7yB2z?=
 =?us-ascii?q?m7E4ZSZmBHDFCMDHjpe5+FW/cKdCKdPMthniYYWrimTo8rzQuuuxPiy7p7Mu?=
 =?us-ascii?q?rU/TUVtZDm1Nhy/e3TjxAy9SdvAsSbyW6NSn97nmISSz8xxqB/rlR3yk2f3q?=
 =?us-ascii?q?hgn/xYCdtT6utSUggkL57cwPJ1BsvyWg3beteJTFanQtO8DT4tSdIxxscEY1?=
 =?us-ascii?q?xhFNW6khDDwy2qDqcNl7OVGJw77Ljc3nnqKsZ8zXbG2rMhgEM7TcRRL2Kpm7?=
 =?us-ascii?q?Rz9w/JB47Gi0+ZjbqldbwA3C7R82eO1XCBs11dUAFuSqjFXm4QZlHQrdvn4k?=
 =?us-ascii?q?POVbiuCa4oMgFZ086NNrNKasH1jVVBXPrjPdXeY2S+m2e3HhuI3K2DY5fqe2?=
 =?us-ascii?q?oHwCXRElQLkwcW/XyeLwgxGj+ho37CDDxpDV/vYUTs8e54qHyhVU841QWKYF?=
 =?us-ascii?q?dh17qp+x4Vg+KTS/UI07IAuSchrSh0HVmn09LXDdqAuxRufKFGbdwh51dH0H?=
 =?us-ascii?q?rTtxZhMZy4M6BimlkefhxtsEP1yxV6EYZAntYwrHMs0gVyLbiU0FRbdzOXxZ?=
 =?us-ascii?q?rwIKHYKnHu/BCzbK7bwl/f0NeS+qcL8/k4qEvsvBuvFkU893Vryd5V02GT5p?=
 =?us-ascii?q?/SFgodTYrxUlor9xh9v7zaejMy557Q1X1xKqm5qSTC1MgsBOQ+0BmsZdBfML?=
 =?us-ascii?q?mLFAXqCc0VG9CuKPA2m1iudh8EOfhS+7AvMsy4c/uG3LCkPPxlnD28i2RL+o?=
 =?us-ascii?q?F93V+W+yVmV+7Cx4wFzO2A3gubSzf8i0+svdr0mY1fYTESH2y/yTXrBYJLZ6?=
 =?us-ascii?q?1ye5oLBnmqI8Gt2tp+gJvtUWZC9FG/H1MGxNOpeR2KYlzh0g1Q0UsWrGejmS?=
 =?us-ascii?q?u5yTx0ji0prrCY3CzIwuTjewALNXNVS2N6l1fjPZC0j8wGXEivdwUmigGl6l?=
 =?us-ascii?q?z8x6havqt/KXLeQUhPfyjxIGFiVrW/uqCebM5I7ZMiqT9XX/ikYVCGVr79pA?=
 =?us-ascii?q?MX0yLnH2tD3z80bSqqupXnkBFhkm2dL2x8rH/DdsFx3xvQ+NvcRftJ1DocWC?=
 =?us-ascii?q?Z4kSXXBkS7P9Sx/9WUkJPDsvukWG+6TJ1cbzTkzYOauyun/2FlHRq/n/WrkN?=
 =?us-ascii?q?39DQc6yTP718VtVSjQqBb8Y4/r17m1MO5+fUlnGkX868xkFYF6iYYwmp4Q1m?=
 =?us-ascii?q?YAhpmP/noIj33zMdNF1qL6dnYNQiQLw9HN6gj/xEJjNm6Jx57+VniFw8thYc?=
 =?us-ascii?q?W6bX0S2i4k4MBKBqiV4adAnSt0uVq4sRnRbeJznjcH1/Qh9mMVjP8SuAou0i?=
 =?us-ascii?q?WdBagSEVNfPSz2mBSC98q+o7lPZGazbbiw01JzndSgDLGEvwFdV2/1eow8Ei?=
 =?us-ascii?q?Bs88V/KlPM0GHz6439fdnQas8ctgCQkxjelOVVNp0xmeQQhSZ9OmLyo2cly+?=
 =?us-ascii?q?glghxqx526u5KHK2p19qKjHhFYLiH1Z98U+jz1lqZRgMKW34GpHpV8FTQGR4?=
 =?us-ascii?q?XoTf22HzIIr/jnNBiBECc6qniFHbrTBwif6F1pr3jXCZCkK2mXJGUFzdVlXB?=
 =?us-ascii?q?SdIE1fgAYJXDQ1h5I2DBqqxMn4fEd6+D8R/Fj4pQVIyu9zMxn/U3zfpBuzaj?=
 =?us-ascii?q?suSZifKhRW7htY6EjIL8OR9P98Eztf/p27owyHMnabaBhQDWEVRkyEAEjuPr?=
 =?us-ascii?q?2v5dnG7uiZCfK+L+PSbrmXtONRSemIyImr0otn5DaMKt6PMmNlD/w63kpMR2?=
 =?us-ascii?q?t2G9/DlzUIUSwXmDrHb9SHqxek5i13sse//ezvWALu44uPFrRTPcx3+x+sm6?=
 =?us-ascii?q?eDNvWQizpiJDZG2ZMD22XIxKIc3FEMkSFucSeiEbAauS7KVqLQlbddDwQHZC?=
 =?us-ascii?q?NrKMtI86U80xFKOc7DkNP10bB4jv8xC1hbTFDhnsCpZdcWI2ymMFPHBV2LNK?=
 =?us-ascii?q?idJTHR2MH3b7mwSbtOg+VI5FWMvmOyF0LzMyXLvSTlXhasNv8E2CifMQxTqc?=
 =?us-ascii?q?e3bxpkD2vkUvriaxumIJl2iyE7xfs/gXaccSY+OD1xaAtoqaeK7DgQ1vd6HH?=
 =?us-ascii?q?Zb72FNK+CBliff6PPXfNJeivZxDSk8t+te5GU8g+9O4TtLSdR1kS/Wv9goqF?=
 =?us-ascii?q?ajxK3H8jd7XQAGmDdJgJmXp0wqbb3U6pRaS17F+hwX5GmdAhhMoMFqXJmnkr?=
 =?us-ascii?q?pWw9zDk+rYIS1c+tbU+oMQCoDxJcaAeC4oOh/kMD3ZFg0ISXisL26JwwR8lv?=
 =?us-ascii?q?6VvliSqp4zsNC4nZsIRbhzTlE5FvoGTE9iGYpGaN11WTQimKXdiMcI+Xu4oR?=
 =?us-ascii?q?/5QMRco4CBV/SODPGpIzGcx/EQZRwPx7rja4AaNpH63UFkQl17mpnaXUvWQd?=
 =?us-ascii?q?1J5CZma1lw6GxJ/WhzTyUIx0v/bR2q4WMUC7bglwUqoghze+Ig8HHr+VhhYh?=
 =?us-ascii?q?L1pS802GU8kN7ih3jFbz/1KI+zUJtQBi6ysFI+ZNezew9oaUWXlEdnOS3eTq?=
 =?us-ascii?q?kZ26NpaGR2kyfHsJ5FELhbV6ISJFc1xPqXbvgsmXlYrii9wEZBrb/AEZZKmQ?=
 =?us-ascii?q?8ufISppnQG2g4lZcNjdoLKI68c9URdnqKDuGeT0+k1xAIPbxIW/Hi6ZD8DuE?=
 =?us-ascii?q?tOMKIvYSWv4Lo/ukS5hzJfdT1UBLIRqfVw+xZ4Yr7Rwg=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2DbAgDbWDxe/wHyM5BmHAEBAQEBBwEBEQEEBAEBgXuBf?=
 =?us-ascii?q?YEYVCESKoQViQOGZQEBAQaBEiWJcJFLCQEBAQEBAQEBAS0KAQGBTIIvRQKCY?=
 =?us-ascii?q?TgTAhABAQEEAQEBAQEFAwEBbIU3DII7KQGDAgEFIxUtFBALGAICJgICVwYBD?=
 =?us-ascii?q?AYCAQGCYz8BglYlD60kgTKESUFAg1SBPoEOKolagmN5gQeBOAwDgl0+gmQBA?=
 =?us-ascii?q?gEChHGCXgSQHIciRpdngkSCToR8jnYGG4JIeIcYkDMtjjWBS4chlEgigVgrC?=
 =?us-ascii?q?AIYCCEPgycJFjEYDY4pFxWIT4UIAVQjAzACBQaOPQEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 06 Feb 2020 18:22:26 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 016ILOKQ195174; Thu, 6 Feb 2020 13:21:24 -0500
Subject: Re: [PATCH v6 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 James Morris <jmorris@namei.org>, Serge Hallyn <serge@hallyn.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <576a6141-36d4-14c0-b395-8d195892b916@linux.intel.com>
 <a4c5da70-b6d1-b133-9b64-34e164834b03@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <5be0f67c-17e2-7861-37f3-a0f8a82be8f0@tycho.nsa.gov>
Date: Thu, 6 Feb 2020 13:23:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a4c5da70-b6d1-b133-9b64-34e164834b03@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andi Kleen <ak@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, oprofile-list@lists.sf.net,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/5/20 12:30 PM, Alexey Budankov wrote:
> 
> Introduce CAP_PERFMON capability designed to secure system performance
> monitoring and observability operations so that CAP_PERFMON would assist
> CAP_SYS_ADMIN capability in its governing role for performance monitoring
> and observability subsystems.
> 
> CAP_PERFMON hardens system security and integrity during performance
> monitoring and observability operations by decreasing attack surface that
> is available to a CAP_SYS_ADMIN privileged process [2]. Providing the access
> to system performance monitoring and observability operations under CAP_PERFMON
> capability singly, without the rest of CAP_SYS_ADMIN credentials, excludes
> chances to misuse the credentials and makes the operation more secure.
> Thus, CAP_PERFMON implements the principal of least privilege for performance
> monitoring and observability operations (POSIX IEEE 1003.1e: 2.2.2.39 principle
> of least privilege: A security design principle that states that a process
> or program be granted only those privileges (e.g., capabilities) necessary
> to accomplish its legitimate function, and only for the time that such
> privileges are actually required)
> 
> CAP_PERFMON meets the demand to secure system performance monitoring and
> observability operations for adoption in security sensitive, restricted,
> multiuser production environments (e.g. HPC clusters, cloud and virtual compute
> environments), where root or CAP_SYS_ADMIN credentials are not available to
> mass users of a system, and securely unblocks accessibility of system performance monitoring and observability operations beyond root and CAP_SYS_ADMIN use cases.
> 
> CAP_PERFMON takes over CAP_SYS_ADMIN credentials related to system performance
> monitoring and observability operations and balances amount of CAP_SYS_ADMIN
> credentials following the recommendations in the capabilities man page [1]
> for CAP_SYS_ADMIN: "Note: this capability is overloaded; see Notes to kernel
> developers, below." For backward compatibility reasons access to system
> performance monitoring and observability subsystems of the kernel remains
> open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN capability
> usage for secure system performance monitoring and observability operations
> is discouraged with respect to the designed CAP_PERFMON capability.
> 
> Although the software running under CAP_PERFMON can not ensure avoidance
> of related hardware issues, the software can still mitigate these issues
> following the official hardware issues mitigation procedure [2]. The bugs
> in the software itself can be fixed following the standard kernel development
> process [3] to maintain and harden security of system performance monitoring
> and observability operations.
> 
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

This will require a small update to the selinux-testsuite to correctly 
reflect the new capability requirements, but that's easy enough.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

> ---
>   include/linux/capability.h          | 4 ++++
>   include/uapi/linux/capability.h     | 8 +++++++-
>   security/selinux/include/classmap.h | 4 ++--
>   3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/capability.h b/include/linux/capability.h
> index ecce0f43c73a..027d7e4a853b 100644
> --- a/include/linux/capability.h
> +++ b/include/linux/capability.h
> @@ -251,6 +251,10 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
>   extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
>   extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
>   extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
> +static inline bool perfmon_capable(void)
> +{
> +	return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
> +}
>   
>   /* audit system wants to get cap info from files as well */
>   extern int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps);
> diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> index 240fdb9a60f6..8b416e5f3afa 100644
> --- a/include/uapi/linux/capability.h
> +++ b/include/uapi/linux/capability.h
> @@ -366,8 +366,14 @@ struct vfs_ns_cap_data {
>   
>   #define CAP_AUDIT_READ		37
>   
> +/*
> + * Allow system performance and observability privileged operations
> + * using perf_events, i915_perf and other kernel subsystems
> + */
> +
> +#define CAP_PERFMON		38
>   
> -#define CAP_LAST_CAP         CAP_AUDIT_READ
> +#define CAP_LAST_CAP         CAP_PERFMON
>   
>   #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
>   
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 7db24855e12d..c599b0c2b0e7 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -27,9 +27,9 @@
>   	    "audit_control", "setfcap"
>   
>   #define COMMON_CAP2_PERMS  "mac_override", "mac_admin", "syslog", \
> -		"wake_alarm", "block_suspend", "audit_read"
> +		"wake_alarm", "block_suspend", "audit_read", "perfmon"
>   
> -#if CAP_LAST_CAP > CAP_AUDIT_READ
> +#if CAP_LAST_CAP > CAP_PERFMON
>   #error New capability defined, please update COMMON_CAP2_PERMS.
>   #endif
>   
> 

