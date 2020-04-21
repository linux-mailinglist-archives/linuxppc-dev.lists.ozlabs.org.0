Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C41B2376
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495zYH1Hw8zDqwB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:58:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deneb.enyo.de (client-ip=37.24.231.21; helo=albireo.enyo.de;
 envelope-from=fw@deneb.enyo.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495zWD3B9hzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:57:10 +1000 (AEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jQpeG-0001PA-Iu; Tue, 21 Apr 2020 09:57:00 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jQpeG-0008JI-Gx; Tue, 21 Apr 2020 11:57:00 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416095800.GC23945@port70.net>
 <1587341904.1r83vbudyf.astroid@bobo.none>
 <20200420012904.GY11469@brightrain.aerifal.cx>
 <1587348046.pwnfbo52iq.astroid@bobo.none>
 <20200420211751.GF23945@port70.net>
Date: Tue, 21 Apr 2020 11:57:00 +0200
In-Reply-To: <20200420211751.GF23945@port70.net> (Szabolcs Nagy's message of
 "Mon, 20 Apr 2020 23:17:51 +0200")
Message-ID: <87eeshupoz.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: libc-dev@lists.llvm.org, Rich Felker <dalias@libc.org>,
 Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Szabolcs Nagy:

> * Nicholas Piggin <npiggin@gmail.com> [2020-04-20 12:08:36 +1000]:
>> Excerpts from Rich Felker's message of April 20, 2020 11:29 am:
>> > Also, allowing patching of executable pages is generally frowned upon
>> > these days because W^X is a desirable hardening property.
>> 
>> Right, it would want be write-protected after being patched.
>
> "frowned upon" means that users may have to update
> their security policy setting in pax, selinux, apparmor,
> seccomp bpf filters and who knows what else that may
> monitor and flag W&X mprotect.
>
> libc update can break systems if the new libc does W&X.

It's possible to map over pre-compiled alternative implementations,
though.  Basically, we would do the patching and build time and store
the results in the file.

It works best if the variance is concentrated on a few pages, and
there are very few alternatives.  For example, having two syscall APIs
and supporting threading and no-threading versions would need four
code versions in total, which is likely excessive.
