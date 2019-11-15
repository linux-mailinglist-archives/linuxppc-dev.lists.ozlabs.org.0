Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14621FD3CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:46:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dm5q68cszF3c0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:46:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dm255TldzF5Rq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:43:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Loa5uFfL"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dm245tJ5z9sPJ;
 Fri, 15 Nov 2019 15:43:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573793004;
 bh=HxFaGkG9m+U3d6KFN1BMwmsZoRm687tbe3eNQrQRjsA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Loa5uFfLnbl71Iiwcvlq7POu3cM5ZK84K1ffXTohrWAPom1GNDVIezv+KAATHrA9b
 9jov84GWIJhxM1Qh+k+cJIFCeu3/Pr2Ej95+qpnOP9rQl4XT8IVadJz1LXsT7A8EJI
 MN9VS42zEuwe41iY2a9SP1gCE3cMXZoC2DTi/1ZFlMuRuqBbKBjtIMv5WdrHjsdm8L
 NsirZQ0ghyKXUi8NtBbTzSMzgJ1oEMqYF7tjnw01o/G1dS2uMBKwNciHKdAal2hseX
 AHCfSPA/F5ftpG8Z3ZHli+A3cbL79H3SX1eBRqr7doBI5jeo5FM+8j3gFaK31NpNkG
 8BmxIWXVh4+FQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: WARN_ONCE does not warn once
In-Reply-To: <20191114194417.GI11661@kitsune.suse.cz>
References: <20191114164655.GH11661@kitsune.suse.cz>
 <20191114194417.GI11661@kitsune.suse.cz>
Date: Fri, 15 Nov 2019 15:43:24 +1100
Message-ID: <875zjleolv.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Thu, Nov 14, 2019 at 05:46:55PM +0100, Michal Such=C3=A1nek wrote:
>> Hello,
>>=20
>> on powernv with 5.3.8 kernel I get flood of messages on boot.
>>=20
>> The messages match WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
>
> Asking around it was pointed out that WARN_ONCE warns up to as many
> times as you have CPUs.

Does it?

> Did not bother counting the messages but it may very well be the case it
> is printed once for each CPU.

The way it's implemented is slightly racy, but I'd be surprised if every
CPU hit that race all at once.

Can you give us the full dmesg?

cheers
