Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 614181443CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 18:58:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482GV00mk7zDqS4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 04:58:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f0UMJKfm; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482GRw4ls0zDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 04:56:09 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id j1so3774429lja.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98bZxOBbCQ3VnMNuVxei8T8EkXL1AFFFNz8Ptr5Fwf4=;
 b=f0UMJKfmKZdH5ae7CC35Bo8JfJuzIWwRMR2d3DvgxxocOt4ZxltoLSDNLwnzFZ8sCh
 mHQ747HPLwIz8jiYkjw/ZBy7Z+2kGJIfn0vBm2e30i+bbMJpifVwiABEulHvlUjKF3e+
 zmkyIyJf834Xz+CPHcMmtF5hwd//KEWq0xygi0vqFBd3IcGN7Ao8G+F+LXLzP7r3FTHU
 oWLSaaKu9S1cZeQ2mmM7DUSMHSd9Ajyf0ADQRJWavAuhTtXQndb3srd5FE+ES5vHQ81S
 2hSAKezaBjD/oILoUk/qKVeqjfM7viogSA5lWNPJ1ygAzh6EIYbDvnDKr6JiQhFI5jr2
 EyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98bZxOBbCQ3VnMNuVxei8T8EkXL1AFFFNz8Ptr5Fwf4=;
 b=Z1oGt2feex0GbWDbIB98dIxh0zRTdD68VjRS1t6NT1ohcKklE5spnUoHmIg1yVRlW/
 QxOV0IU66pjstj/bdX41fVZq6nmv93orXJ66MoRKVwxem5acniUAnWnoPJh5/rQnclJ0
 u9qMfflBYOehuft8SQByv4MpUvTsywuwDyeor1sTJdufcNRrAOAM8fxndJKyuEEyZKVu
 lrj6fxY00CQruOzXi3KqMOmukZ6fVXBp+0eFjLLwPwRVN+BtyMPNTRq2FgLqTLZQCQHg
 JmC5zAEl5k0h/NQMSkAP6kCpdeyC+w2w32c1WFvjakzQ3zRCc0UuKt4iCLoC/+Ruwp/N
 FMpg==
X-Gm-Message-State: APjAAAXwQ76nLZGbBCd2E6nGcIQ36c7iiP8RcrKuO4LOTnfRyYZEfZ1n
 4MMMn9QInQFNeNPuPZ3kQ3g2jfjsyfQ/VmuKG6c=
X-Google-Smtp-Source: APXvYqzSduuvbYALVkj//Xrt9JfaU9cf6Qr6bCvfXcM6mqwY1KvupDpCfJTjcSWmOKPsyFlFi8k1zTlkXGNFH8MYpJ4=
X-Received: by 2002:a05:651c:8f:: with SMTP id
 15mr17366951ljq.109.1579629365512; 
 Tue, 21 Jan 2020 09:56:05 -0800 (PST)
MIME-Version: 1.0
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
In-Reply-To: <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Jan 2020 09:55:53 -0800
Message-ID: <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Robert Richter <rric@kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andy Lutomirski <luto@amacapital.net>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
<alexey.budankov@linux.intel.com> wrote:
>
>
> On 21.01.2020 17:43, Stephen Smalley wrote:
> > On 1/20/20 6:23 AM, Alexey Budankov wrote:
> >>
> >> Introduce CAP_PERFMON capability designed to secure system performance
> >> monitoring and observability operations so that CAP_PERFMON would assist
> >> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
> >> and other performance monitoring and observability subsystems.
> >>
> >> CAP_PERFMON intends to harden system security and integrity during system
> >> performance monitoring and observability operations by decreasing attack
> >> surface that is available to a CAP_SYS_ADMIN privileged process [1].
> >> Providing access to system performance monitoring and observability
> >> operations under CAP_PERFMON capability singly, without the rest of
> >> CAP_SYS_ADMIN credentials, excludes chances to misuse the credentials and
> >> makes operation more secure.
> >>
> >> CAP_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
> >> system performance monitoring and observability operations and balance
> >> amount of CAP_SYS_ADMIN credentials following the recommendations in the
> >> capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability is
> >> overloaded; see Notes to kernel developers, below."
> >>
> >> Although the software running under CAP_PERFMON can not ensure avoidance
> >> of related hardware issues, the software can still mitigate these issues
> >> following the official embargoed hardware issues mitigation procedure [2].
> >> The bugs in the software itself could be fixed following the standard
> >> kernel development process [3] to maintain and harden security of system
> >> performance monitoring and observability operations.
> >>
> >> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> >> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
> >> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
> >>
> >> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> >> ---
> >>   include/linux/capability.h          | 12 ++++++++++++
> >>   include/uapi/linux/capability.h     |  8 +++++++-
> >>   security/selinux/include/classmap.h |  4 ++--
> >>   3 files changed, 21 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/linux/capability.h b/include/linux/capability.h
> >> index ecce0f43c73a..8784969d91e1 100644
> >> --- a/include/linux/capability.h
> >> +++ b/include/linux/capability.h
> >> @@ -251,6 +251,18 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
> >>   extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
> >>   extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
> >>   extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
> >> +static inline bool perfmon_capable(void)
> >> +{
> >> +    struct user_namespace *ns = &init_user_ns;
> >> +
> >> +    if (ns_capable_noaudit(ns, CAP_PERFMON))
> >> +        return ns_capable(ns, CAP_PERFMON);
> >> +
> >> +    if (ns_capable_noaudit(ns, CAP_SYS_ADMIN))
> >> +        return ns_capable(ns, CAP_SYS_ADMIN);
> >> +
> >> +    return false;
> >> +}
> >
> > Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
>
> Some of ideas from v4 review.

well, in the requested changes form v4 I wrote:
return capable(CAP_PERFMON);
instead of
return false;

That's what Andy suggested earlier for CAP_BPF.
I think that should resolve Stephen's concern.
