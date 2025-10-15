Return-Path: <linuxppc-dev+bounces-12922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FCBDEB42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 15:17:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cms8N5R2Vz3dBb;
	Thu, 16 Oct 2025 00:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.82 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760534276;
	cv=pass; b=m/YSD1cBoQqyvy+hsIioeiae8mmxovIkxYJt+n04RbhH+Jkm887W/jqgML+4fPhK8+CD0cHsUQh2FRYJEyXmAlRVrDfo+l324FkLWFEUeuNWKkJaaco0Z9VMe8D25AlcaZDMMUNjGZsIyzfAOsDFaMPb5NRN4fR3qktOPLiujFWrgaeftxKNc1/rbwYYBoeBAEUBHGNpab8VDpVYLqYmp+T4fEOpnv0RtQU2hwLr0ftECTT+OOWtco666Fgccn1W4zv2TMXWrk8A9YJBNbmu4pBu+Nv73XSko1AtKXhKSygoxAIInT7nviEET7nAGWnTy9atp7fmX3XCICDiEYuiLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760534276; c=relaxed/relaxed;
	bh=E2QnsoOmDEvTeEWVN1qoZiMdpBF/8hhdfYA9u5NKFT4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=nCy1OsZiKPtlENBIHR6NLXGeJhbrurW1ohrqqi+4f4f0TfmqL6GxWFAS0QVltUdbMCvY/4ApCSlzAoh5XBbGqGtoSw686ZfWIQW6j2DwrurMWwK6cq9vo8qJPFE60hjSPcjzJSK3frphmkDwDeiy3jx8eUI5arKLAhoQ7e8RvSWxGB+BdKlgP5oZTL4RGjKC8oJpep6gkO17Sg/kd74UkBfd0BdY7Jnd4CHl+ZMPY7Yyqq6bg7ME4dmYEk8dAbLA0l37p9qepaoPIWmgBQeAyZzYkaKQDEjd8guci7G6W53+j2xguLqrYJt4WJ/5etNgCV7yUZ0gUrWCazSofcrNjQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TfmKwsC7; dkim-atps=neutral; spf=pass (client-ip=85.215.255.82; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TfmKwsC7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.82; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cms8L6ZX1z3d26
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 00:17:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760534270; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KMfi6Hr+bpElYQWQoTQ/fa3HBvK1DjrVSEtQdiHp+tngrJvD6tSmNPbUbY5lQbRrMX
    Svp2qH1hVlRJGE8zd3RjIyU99o8uNtabVvf87IDjEAJfrzJyEdWnp4fA3RlB6ybeWblX
    xz9Vd/wpFQRiMPa55xqRXxrL4Knz+Dg31viDShehkswzWwq+GsvHLfripVnei1C5KB9E
    pQE/O0t12lTCxcYv9PV6qbs/rU+mDQKTOC/yLexEI5hHACHGqIPqNH2z840GlhhkQbO2
    79GXLaTJuw0Thx2gm0L8oQP3TYN9koLXy5/BIWUm/frG7qR+j6zUqM3gYTzruXzWgIu3
    +7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760534270;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=E2QnsoOmDEvTeEWVN1qoZiMdpBF/8hhdfYA9u5NKFT4=;
    b=AkefBaOpENTuBoKnmbehgGly8Of+IlEd5V8od26C8Lwk+A9zCoMr77jYW8xoYmxRRA
    9q6wF+OixY9/5xLcJ3ViFMzHgdUfQxfVF0Jqyj4OFGdUoW/25exQINjbSYyrx69CZx8Z
    dcVXjRKlo4n4IWHOvkmfevr5zHagvYbL0f+F5abAq8qB9kT8RN+QDSWw343VDbF1UXn6
    gEscaBw3zIHi877b1vxmDx0xamRHRcEkvdw/Y/GZznuwE/yMObQUeCn8Moj44aiulPgt
    z1V4RJwHBYkXFdqbgqRsuPGOPDaNCE7PU0vFEm7gJnhLmCDQzn5AqCLlnmBUW1OpR9bM
    D3ww==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760534270;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=E2QnsoOmDEvTeEWVN1qoZiMdpBF/8hhdfYA9u5NKFT4=;
    b=TfmKwsC71jrVZXNgCQK58OG0DGJfmQHVFuAdUGR2C7arg9C+atrzX9pypGee40dVNT
    dSrMExfYosa5VWc9pMqG1ZeuQ12WRagInvzt9cP8dHTKjGP6FDOFi4jit8h0JYR6WR3G
    yc6yR5dapwzij6kBjaP82F0zpdpi/BNb6ea1sIua5rSWS9c87OwQjcaxGCbmlrWdkrdN
    0+wg0ZNqYMgl/Si0o6I1wpgDoyJe1pXNNbYNjVE4pcgiXaMUTXrTc5e7aXd7Vi2IuAFH
    EOLXd4QMuI1eqQk/Dczzd7jgU316MyXd9RiRccmfaJNAouGSW0c9HBlzqYl9bgHa3xe0
    UI0A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXax+ofCi2ru+NWolPb67sCbW3uT"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FDHoXcR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 15:17:50 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Date: Wed, 15 Oct 2025 15:17:39 +0200
Message-Id: <D5EAC41A-837B-4170-8707-7CAE2D630106@xenosoft.de>
References: <76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Am 15 October 2025 at 02:59 pm, Herve Codina <herve.codina@bootlin.com> wrot=
e:

Also when it boots, it is not easy to know about the problem root cause.

In my case, it was not obvious to make the relationship on my side between
my ping timings behavior and ASPM.

Of course 'git bisect' helped a lot but can we rely on that for the average
user?

Best regards,
Herv=C3=A9

=E2=80=94-

I think I will revert these modifications for the RC2.

Patch for reverting: https://raw.githubusercontent.com/chzigotzky/kernels/re=
fs/heads/main/patches/e5500/pci.patch


