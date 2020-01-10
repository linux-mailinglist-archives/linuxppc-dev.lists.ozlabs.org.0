Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A01AF137A05
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 00:16:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vf4v4GhSzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 10:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=anderson@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NbY9FJVK; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vdn82P6YzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 10:03:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578697382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZ3MJlwKsmTahhEKZ7liwmdaP72hxHg0nFRVSSgd63k=;
 b=NbY9FJVKiYp8SE+0/5Y1OnVHcvNPJ5EaEoMhrACqb4CU2bB6pzrISMFls3NXtGYGgop6N0
 hJqiCJzHbJgSVIRxUBW2UE5SVnRbntXsMicFgFVy77aDeYuNCF68+L4u0XTrPoXkJlbtOR
 inwq5F9cWbFDcjkn0wzh0oirmMd7FPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-JSww2fMSNV2NKcoejt9luw-1; Fri, 10 Jan 2020 14:00:15 -0500
X-MC-Unique: JSww2fMSNV2NKcoejt9luw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4E2B8048F1;
 Fri, 10 Jan 2020 19:00:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 878E35E241;
 Fri, 10 Jan 2020 19:00:11 +0000 (UTC)
Received: from zmail24.collab.prod.int.phx2.redhat.com
 (zmail24.collab.prod.int.phx2.redhat.com [10.5.83.30])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 301E581C72;
 Fri, 10 Jan 2020 19:00:11 +0000 (UTC)
Date: Fri, 10 Jan 2020 14:00:10 -0500 (EST)
From: Dave Anderson <anderson@redhat.com>
To: James Morse <james.morse@arm.com>
Message-ID: <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
In-Reply-To: <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.120.164, 10.4.195.27]
Thread-Topic: arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
Thread-Index: ic50YQVuXt31PDeSAHGv7IV2UM9mpA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Sat, 11 Jan 2020 10:15:14 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, Bhupesh Sharma <bhsharma@redhat.com>,
 x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 bhupesh linux <bhupesh.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> Hi Bhupesh,
>=20
> On 25/12/2019 19:01, Bhupesh Sharma wrote:
> > On 12/12/2019 04:02 PM, James Morse wrote:
> >> On 29/11/2019 19:59, Bhupesh Sharma wrote:
> >>> vabits_actual variable on arm64 indicates the actual VA space size,
> >>> and allows a single binary to support both 48-bit and 52-bit VA
> >>> spaces.
> >>>
> >>> If the ARMv8.2-LVA optional feature is present, and we are running
> >>> with a 64KB page size; then it is possible to use 52-bits of address
> >>> space for both userspace and kernel addresses. However, any kernel
> >>> binary that supports 52-bit must also be able to fall back to 48-bit
> >>> at early boot time if the hardware feature is not present.
> >>>
> >>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
> >>> addressed by TTBR1_EL1 (and hence can be used for determining the
> >>> vabits_actual value) it makes more sense to export the same in
> >>> vmcoreinfo rather than vabits_actual variable, as the name of the
> >>> variable can change in future kernel versions, but the architectural
> >>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
> >>> specific fields to user-space.
> >>>
> >>> User-space utilities like makedumpfile and crash-utility, need to
> >>> read/write this value from/to vmcoreinfo
> >>
> >> (write?)
> >=20
> > Yes, also write so that the vmcoreinfo from an (crashing) arm64 system =
can
> > be used for
> > analysis of the root-cause of panic/crash on say an x86_64 host using
> > utilities like
> > crash-utility/gdb.
>=20
> I read this as as "User-space [...] needs to write to vmcoreinfo".
>=20
>=20
> >>> for determining if a virtual address lies in the linear map range.
> >>
> >> I think this is a fragile example. The debugger shouldn't need to know
> >> this.
> >=20
> > Well that the current user-space utility design, so I am not sure we ca=
n
> > tweak that too much.
> >=20
> >>> The user-space computation for determining whether an address lies in
> >>> the linear map range is the same as we have in kernel-space:
> >>>
> >>> =C2=A0=C2=A0 #define __is_lm_address(addr)=C2=A0=C2=A0=C2=A0 (!(((u64=
)addr) & BIT(vabits_actual -
> >>> =C2=A0=C2=A0 1)))
> >>
> >> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA space")=
. If
> >> user-space
> >> tools rely on 'knowing' the kernel memory layout, they must have to
> >> constantly be fixed
> >> and updated. This is a poor argument for adding this to something that
> >> ends up as ABI.
> >=20
> > See above. The user-space has to rely on some ABI/guaranteed
> > hardware-symbols which can be
> > used for 'determining' the kernel memory layout.
>=20
> I disagree. Everything and anything in the kernel will change. The ABI ru=
les apply to
> stuff exposed via syscalls and kernel filesystems. It does not apply to k=
ernel internals,
> like the memory layout we used yesterday. 14c127c957c1 is a case in point=
.
>=20
> A debugger trying to rely on this sort of thing would have to play catchu=
p whenever it
> changes.

Exactly.  That's the whole point.

The crash utility and makedumpfile are not in the same league as other user=
-space tools.
They have always had to "play catchup" precisely because they depend upon k=
ernel internals,
which constantly change.

Dave=20

