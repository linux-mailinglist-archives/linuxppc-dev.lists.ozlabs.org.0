Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0B9F7AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 03:11:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J74V3FPYzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:11:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u/ExOsRv"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J72X6tS1zDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 11:10:11 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id d85so536730pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Cm4+sco0s6cYO4zUw4CliySd8ssk90JOxUd9/4P8t0w=;
 b=u/ExOsRvJEn2d/9UAiNlynHeGF996rWJzn0OLqeRtUwx2BUqjrpl6oM1uqGeZDN2f0
 oJ9C0czvZHgju7vQNShs19muk4xzCaj2OX9WzC1VihK92fgEmYJisR2U8sosfDj6p/hg
 QX0AtoLxIhyZfUVR/Bfji98w6oH7guv0qwYMxGvgQZXCinN5tY+IZO0klr9pcjNWu8md
 M88fipOpPYhW8xuw9WqvlpHQzzVYt9LTpPZrHS5pFhqocAb2WIcje21NXyxbMHwTaL62
 7ArPRqLKGlYwKl0GSW4+z6KgK+GtO86ckVhIpVkClyUdaY3GdzbvDabJTLJA7QEDu2jR
 3lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Cm4+sco0s6cYO4zUw4CliySd8ssk90JOxUd9/4P8t0w=;
 b=YymMEqukjR1h/ItePC25v6Uxwoje9JEzcwhgfpJxEbh3kJW2892WKoKecIpbgEhKs5
 FwW2IJ3aL89o2Ue1PPn/8ZbxZOLM6jl2EWLBm09B5gcHUfiMzRUxsoXVhMiUZ7rjE2DB
 BmiRSScAgRPmthvEogUJRTWvKroMXgauA8FvRYsGibJE/OpH15aA85Cbff/wFJeUXad/
 UGUdwkMDIzaHkp563TvJDG0AIW+SbScNqfa+1RJfWHsPtZW1Wf0ofD2XiUwBBjiRDpqV
 e6OVnyFvPdIo3VkWILsBQKG6DKfSKoQlGZOfU1cmL6pFVdYMmEvaJr/urB0LXZwb1rnL
 EJ7Q==
X-Gm-Message-State: APjAAAUo9sSHiJhguXv8/onjpOAm9Ck9nYFdDqhLa/vsXhBq4sPykG7e
 mKIwOQOKgw3c4EIafQ0qW/UpDzTz
X-Google-Smtp-Source: APXvYqzyVq7hABUvAVTU6nEoo1MMTdSj9IQZpG5pK0rX9Ns3tEJwxpqDAhcf0EHiADtq5MvZbOsCiA==
X-Received: by 2002:aa7:9e0a:: with SMTP id y10mr1626539pfq.93.1566954608772; 
 Tue, 27 Aug 2019 18:10:08 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id v145sm570114pfc.31.2019.08.27.18.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 18:10:08 -0700 (PDT)
Date: Wed, 28 Aug 2019 11:09:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [DOC][PATCH] powerpc: Provide initial documentation for PAPR
 hcalls
To: linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20190827152326.2784-1-vaibhav@linux.ibm.com>
In-Reply-To: <20190827152326.2784-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566953985.jpf4ea1x9i.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: msuchanek@suse.de, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain's on August 28, 2019 1:23 am:
> This doc patch provides an initial description of the hcall op-codes
> that are used by Linux kernel running as a guest (LPAR) on top of
> PowerVM or any other sPAPR compliant hyper-visor (e.g qemu).
>=20
> Apart from documenting the hcalls the doc-patch also provides a
> rudimentary overview of how hcall ABI, how they are issued with the
> Linux kernel and how information/control flows between the guest and
> hypervisor.
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
>=20
> Initial version of this doc-patch was posted and reviewed as part of
> the patch-series "[PATCH v5 0/4] powerpc/papr_scm: Workaround for
> failure of drc bind after kexec"
> https://patchwork.ozlabs.org/patch/1136022/. Changes introduced on top
> the original patch:
>=20
> * Replaced the of term PHYP with Hypervisor to indicate both
> PowerVM/Qemu [Laurent]
> * Emphasized that In/Out arguments to hcalls are in Big-endian format
> [Laurent]
> * Fixed minor word repetition, spell issues and grammatical error
> [Michal, Mpe]
> * Replaced various variant of term 'hcall' with a single
> variant. [Mpe]
> * Changed the documentation format from txt to ReST. [Mpe]
> * Changed the name of documentation file to papr_hcalls.rst. [Mpe]
> * Updated the section describing privileged operation by hypervisor
> to be more accurate [Mpe].
> * Fixed up mention of register notation used for describing
> hcalls. [Mpe]
> * s/NVDimm/NVDIMM [Mpe]
> * Added section on return values from hcall [Mpe]
> * Described H_CONTINUE return-value for long running hcalls.
> ---
>  Documentation/powerpc/papr_hcalls.rst | 200 ++++++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 Documentation/powerpc/papr_hcalls.rst
>=20
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerp=
c/papr_hcalls.rst
> new file mode 100644
> index 000000000000..7afc0310de29
> --- /dev/null
> +++ b/Documentation/powerpc/papr_hcalls.rst
> @@ -0,0 +1,200 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Hypercall Op-codes (hcalls)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Virtualization on 64-bit Power Book3S Platforms is based on the PAPR
> +specification [1]_ which describes the run-time environment for a guest
> +operating system and how it should interact with the hypervisor for
> +privileged operations. Currently there are two PAPR compliant hypervisor=
s:
> +
> +- **IBM PowerVM (PHYP)**: IBM's proprietary hypervisor that supports AIX=
,
> +  IBM-i and  Linux as supported guests (termed as Logical Partitions
> +  or LPARS). It supports the full PAPR specification.
> +
> +- **Qemu/KVM**: Supports PPC64 linux guests running on a PPC64 linux hos=
t.
> +  Though it only implements a subset of PAPR specification called LoPAPR=
 [2]_.
> +
> +On PPC64 arch a guest kernel running on top of a PAPR hypervisor is call=
ed
> +a *pSeries guest*. A pseries guest runs in a supervisor mode (HV=3D0) an=
d must
> +issue hypercalls to the hypervisor whenever it needs to perform an actio=
n
> +that is hypervisor priviledged [3]_ or for other services managed by the
> +hypervisor.
> +
> +Hence a Hypercall (hcall) is essentially a request by the pSeries guest
> +asking hypervisor to perform a privileged operation on behalf of the gue=
st. The
> +guest issues a with necessary input operands. The hypervisor after perfo=
rming
> +the privilege operation returns a status code and output operands back t=
o the
> +guest.
> +
> +HCALL ABI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The ABI specification for a hcall between a pSeries guest and PAPR hyper=
visor
> +is covered in section 14.5.3 of ref [2]_. Switch to the  Hypervisor cont=
ext is
> +done via the instruction **HVCS** that expects the Opcode for hcall is s=
et in *r3*
> +and any in-arguments for the hcall are provided in registers *r4-r12* in
> +Big-endian byte order.
> +
> +Once control is returns back to the guest after hypervisor has serviced =
the
> +'HVCS' instruction the return value of the hcall is available in *r3* an=
d any
> +out values are returned in registers *r4-r12*. Again like in-arguments, =
all the
> +out value are in Big-endian byte order.
> +
> +Powerpc arch code provides convenient wrappers named **plpar_hcall_xxx**=
 defined
> +in a arch specific header [4]_ to issue hcalls from the linux kernel
> +running as pseries guest.

Thanks for this. Any chance you could replace the hcall convention in
exception-64s.S with a link to this document, and add it in here? It
needs a small fix or two as well, I think I put an ePAPR convention of
r11 for number in there.

Thanks,
Nick
=
