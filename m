Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 883275B00CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 11:45:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMy6l3pZ2z3c6p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:45:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 505 seconds by postgrey-1.36 at boromir; Wed, 07 Sep 2022 19:45:10 AEST
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMy6G6cF3z2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 19:45:10 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id EB4AAD0A;
	Wed,  7 Sep 2022 11:36:38 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with ESMTP id 66C361EAC1;
	Wed,  7 Sep 2022 11:36:38 +0200 (CEST)
Date: Wed, 7 Sep 2022 11:36:37 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/pseries: Fix plpks crash on non-pseries
Message-ID: <20220907113637.5b458b6b@talos.danny.cz>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; powerpc64le-redhat-linux-gnu)
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,
I have tested the fix on top of Fedora's
kernel-6.0.0-0.rc4.20220906git53e99dcff61e.32.fc38 and systems are
booting again.

Tested-By: Dan Hor=C3=A1k <dan@danny.cz>
Reviewed-by: Dan Hor=C3=A1k <dan@danny.cz>


	With regards,

		Dan
