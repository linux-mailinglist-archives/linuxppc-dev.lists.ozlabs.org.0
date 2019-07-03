Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B95EE38
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:17:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDTN4bBxzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:17:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fDRp0qxtzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 07:16:04 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A966AF4C;
 Wed,  3 Jul 2019 21:16:00 +0000 (UTC)
Date: Wed, 3 Jul 2019 23:15:59 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: Kernel Bug/oops during boot (PowerVM LPAR w/vTPM)
Message-ID: <20190703231559.29d54c5c@kitsune.suse.cz>
In-Reply-To: <20190703131716.7e16d840@naga>
References: <49B804EE-726B-4EB4-9BED-116F8FB5B374@linux.vnet.ibm.com>
 <20190703131716.7e16d840@naga>
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
Cc: nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jul 2019 13:17:16 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Wed, 3 Jul 2019 15:54:59 +0530
> Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
>=20
> > Booting mainline kernel on PowerVM LPAR with vTPM enabled results
> > into a kernel crash.
> >=20
> > [    0.365989] BUG: Kernel NULL pointer dereference at 0x00000012
...
> > [    0.366085] NIP [c00000000073dd80] tpm1_pcr_extend+0x130/0x230
> > [    0.366090] LR [c00000000073dcd0] tpm1_pcr_extend+0x80/0x230
...
>=20
> You need to revert (or fix up) commit 0b6cf6b97b7e ("tpm: pass an array
> of tpm_extend_digest structures to tpm_pcr_extend()". At least
> reverting it fixes the issue for me.

FTR this is the revert on lkml https://lkml.org/lkml/2019/7/1/423

>=20
> Thanks
>=20
> Michal
>=20

