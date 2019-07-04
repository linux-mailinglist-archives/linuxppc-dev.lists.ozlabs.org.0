Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE665FAEB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 17:34:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fhpn6CpXzDqDS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 01:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fhn147dczDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 01:32:36 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66563AF81;
 Thu,  4 Jul 2019 15:32:32 +0000 (UTC)
Date: Thu, 4 Jul 2019 17:32:31 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
Message-ID: <20190704173231.27365b51@kitsune.suse.cz>
In-Reply-To: <0EDE02C7-3716-47A2-B7B0-007025F28567@linux.vnet.ibm.com>
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1562241547.6165.81.camel@linux.ibm.com>
 <0EDE02C7-3716-47A2-B7B0-007025F28567@linux.vnet.ibm.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Jul 2019 19:26:36 +0530
Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:

> > On 04-Jul-2019, at 5:29 PM, Mimi Zohar <zohar@linux.ibm.com> wrote:
> >=20
> > On Wed, 2019-07-03 at 23:32 -0400, Nayna Jain wrote: =20
> >> The nr_allocated_banks and allocated banks are initialized as part of
> >> tpm_chip_register. Currently, this is done as part of auto startup
> >> function. However, some drivers, like the ibm vtpm driver, do not run
> >> auto startup during initialization. This results in uninitialized memo=
ry
> >> issue and causes a kernel panic during boot.
> >>=20
> >> This patch moves the pcr allocation outside the auto startup function
> >> into tpm_chip_register. This ensures that allocated banks are initiali=
zed
> >> in any case.
> >>=20
> >> Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms =
with
> >> PCR read")
> >> Signed-off-by: Nayna Jain <nayna@linux.ibm.com> =20
> > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com> =20
>=20
> Thanks for the fix. Kernel boots fine with this fix.
>=20
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>=20

Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>

Thanks

Michal
