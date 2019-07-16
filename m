Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E80B6AE0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 19:54:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p7MG5b1rzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 03:54:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p7KB17CJzDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 03:52:44 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65944AC67;
 Tue, 16 Jul 2019 17:52:39 +0000 (UTC)
Date: Tue, 16 Jul 2019 19:52:38 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v3] tpm: tpm_ibm_vtpm: Fix unallocated banks
Message-ID: <20190716195238.79271980@kitsune.suse.cz>
In-Reply-To: <20190711211357.77bl2ixfnplmumcl@linux.intel.com>
References: <1562861615-11391-1-git-send-email-nayna@linux.ibm.com>
 <20190711202824.dfhzxcqtk5ouud5n@linux.intel.com>
 <20190711211357.77bl2ixfnplmumcl@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jul 2019 00:13:57 +0300
Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> On Thu, Jul 11, 2019 at 11:28:24PM +0300, Jarkko Sakkinen wrote:
> > On Thu, Jul 11, 2019 at 12:13:35PM -0400, Nayna Jain wrote: =20
> > > The nr_allocated_banks and allocated banks are initialized as part of
> > > tpm_chip_register. Currently, this is done as part of auto startup
> > > function. However, some drivers, like the ibm vtpm driver, do not run
> > > auto startup during initialization. This results in uninitialized mem=
ory
> > > issue and causes a kernel panic during boot.
> > >=20
> > > This patch moves the pcr allocation outside the auto startup function
> > > into tpm_chip_register. This ensures that allocated banks are initial=
ized
> > > in any case.
> > >=20
> > > Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms=
 with
> > > PCR read")
> > > Reported-by: Michal Suchanek <msuchanek@suse.de>
> > > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > > Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de> =20
> >=20
> > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> =20
>=20
> Thanks a lot! It is applied now.

Fixes the issue for me.

Thanks

Michal
