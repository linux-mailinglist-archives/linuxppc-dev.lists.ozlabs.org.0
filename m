Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DABB804475
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:07:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qe7PBpLN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkkSM6G7xz3d8d
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 13:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qe7PBpLN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkkRY5hCvz2xQ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 13:06:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701741993;
	bh=PVO+9wWo6qr4JNuSbUNdvryTDg0uALwlRcXUD0FYi5U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qe7PBpLN30VLmmGHSk24LtK1Wlb+pWnz7GaTC+B5PVcEpVv+FcO/OKO6IYRYlxXMW
	 S1w5i4fJXN3dMAGSqC0mA6U6iSwHYsppoLj8IIdapnWg+1CxN/r4mY+XEofQD3xLeN
	 0o/wzmTQPK50vAHNxFU7ejXBLUhKKBtRmxNKaAqWMRL0ZPVW616jGyqBCGBQvH+8S3
	 rEFsAlg9tO5aDXNqo1BLhQDB871+paTPvtiqNJw72mVrJDHDFRfU94X5GAlizlBzp2
	 4p1OS/JWnB+mgiEEV48ADMAEL/STPwN3jNphO46qchvmvYLN6I1GoFWtlpa1P+lN0D
	 r6GGsJbLqOtHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SkkRX3Fwbz4wd0;
	Tue,  5 Dec 2023 13:06:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/6] x86: Use PCI_HEADER_TYPE_* instead of literals
In-Reply-To: <20231201225609.GA534714@bhelgaas>
References: <20231201225609.GA534714@bhelgaas>
Date: Tue, 05 Dec 2023 13:06:29 +1100
Message-ID: <874jgxflne.fsf@mail.lhotse>
MIME-Version: 1.0
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
Cc: x86@kernel.org, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-pci@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, James Smart <james.smart@broadcom.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> [+cc scsi, powerpc folks]
>
> On Fri, Dec 01, 2023 at 02:44:47PM -0600, Bjorn Helgaas wrote:
>> On Fri, Nov 24, 2023 at 11:09:13AM +0200, Ilpo J=C3=A4rvinen wrote:
>> > Replace 0x7f and 0x80 literals with PCI_HEADER_TYPE_* defines.
>> >=20
>> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>>=20
>> Applied entire series on the PCI "enumeration" branch for v6.8,
>> thanks!
>>=20
>> If anybody wants to take pieces separately, let me know and I'll drop
>> from PCI.
>
> OK, b4 picked up the entire series but I was only cc'd on this first
> patch, so I missed the responses about EDAC, xtensa, bcma already
> being applied elsewhere.
>
> So I kept these in the PCI tree:
>
>   420ac76610d7 ("scsi: lpfc: Use PCI_HEADER_TYPE_MFD instead of literal")
>   3773343dd890 ("powerpc/fsl-pci: Use PCI_HEADER_TYPE_MASK instead of lit=
eral")
>   197e0da1f1a3 ("x86/pci: Use PCI_HEADER_TYPE_* instead of literals")
>
> and dropped the others.
>
> x86, SCSI, powerpc folks, if you want to take these instead, let me
> know and I'll drop them.

Nah that's fine, you keep them.

cheers
