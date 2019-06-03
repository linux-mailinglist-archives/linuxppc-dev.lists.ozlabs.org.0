Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F1F33C2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:57:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HsSN1VZNzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="dubeixfj"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HsRH3PPWzDqCc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:56:58 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g21so7593726plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dr+tKOWu/al28vwIIjNYvAuukyFW8hKUum7otTy/uaA=;
 b=dubeixfj68GROHvhQHl0TlgQvu/qN/dWxG1uhGXl+b7q62F7H3YF35N5zDt03TmrJ7
 yUx4Ofi2kFL0A1GmstkucQ9mLj9GR5BERQQKy6WpIkw8/QhrNJSwZA8b7QJCaLszz6ih
 RI9+kPPLq9Lg3k/JFSXuwHLwkPDt+Tj+Gx3AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Dr+tKOWu/al28vwIIjNYvAuukyFW8hKUum7otTy/uaA=;
 b=fV29FJ4YvlVbMdIo/ZrRjUy+nIvexmqLd90zAkGpfR0qv7GbPuXmmhf7lx7mrUNCBj
 eorusJwnjTUVYQzflw9Yhtt33x+qgR5Y9E7nBxAXXi9lUVwtbjZzrhFRUSkGZ+RRvH3Z
 y31Ksn8r9As2OyELNnYbs1skyYhi9F5T3nbrXut/ikqfhR4QdeVGje4hhd/+QCwMU7Vi
 +d8gksJ1aIXj8wflXUEogW4fqGx7LnYgyuKgwbyqH63YuNSYEooZWjSxM2MmqXJrSYGL
 eZVgQb1D0PON20PhQxzoiWdRn0eDHZiKQfAMDWg6iO1mnhcAiUFFIfXD4YnVwhpszS0R
 P/Kg==
X-Gm-Message-State: APjAAAUgJueHMRKZDLdz+CheBBeniRl4Fr01c5I96DOYhZ7zqbG5f7Eq
 /GRU3YX3H8JWWRecLsDMyu3wnw==
X-Google-Smtp-Source: APXvYqz7stKclz4T2A+GKVDzn75Zo74JVpXxm5yfpx5MKL0qgwtv0UZe/qiFCyFpRqvanhLlECh20w==
X-Received: by 2002:a17:902:5c2:: with SMTP id
 f60mr33105207plf.61.1559606215834; 
 Mon, 03 Jun 2019 16:56:55 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id g8sm14414225pjp.17.2019.06.03.16.56.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 16:56:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
In-Reply-To: <20190603072916.GA7545@kroah.com>
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
 <87zhmzxkzz.fsf@dja-thinkpad.axtens.net> <20190603072916.GA7545@kroah.com>
Date: Tue, 04 Jun 2019 09:56:50 +1000
Message-ID: <87tvd6xlx9.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-fsdevel@vger.kernel.org, nayna@linux.ibm.com,
 Nayna <nayna@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 cclaudio@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

>> >> As PowerNV moves towards secure boot, we need a place to put secure
>> >> variables. One option that has been canvassed is to make our secure
>> >> variables look like EFI variables. This is an early sketch of another
>> >> approach where we create a generic firmware variable file system,
>> >> fwvarfs, and an OPAL Secure Variable backend for it.
>> >
>> > Is there a need of new filesystem ? I am wondering why can't these be=
=20
>> > exposed via sysfs / securityfs ?
>> > Probably, something like... /sys/firmware/secureboot or=20
>> > /sys/kernel/security/secureboot/=C2=A0 ?
>>=20
>> I suppose we could put secure variables in sysfs, but I'm not sure
>> that's what sysfs was intended for. I understand sysfs as "a
>> filesystem-based view of kernel objects" (from
>> Documentation/filesystems/configfs/configfs.txt), and I don't think a
>> secure variable is really a kernel object in the same way most other
>> things in sysfs are... but I'm open to being convinced.
>
> What makes them more "secure" than anything else that is in sysfs today?
> I didn't see anything in this patchset that provided "additional
> security", did I miss it?

You're right, there's no additional security. What I should have said
was that I didn't think that _firmware_ variables were kernel objects in
the same way that other things in sysfs are. Having read the rest of
your reply it seems I'm mistaken on this.

> I would just recommend putting this in sysfs.  Make a new subsystem
> (i.e. class) and away you go.
>
>> My hope with fwvarfs is to provide a generic place for firmware
>> variables so that we don't need to expand the list of firmware-specific
>> filesystems beyond efivarfs. I am also aiming to make things simple to
>> use so that people familiar with firmware don't also have to become
>> familiar with filesystem code in order to expose firmware variables to
>> userspace.

>> fwvarfs can also be used for variables that are not security relevant as
>> well. For example, with the EFI backend (patch 3), both secure and
>> insecure variables can be read.
>
> I don't remember why efi variables were not put in sysfs, I think there
> was some reasoning behind it originally.  Perhaps look in the linux-efi
> archives.

I'll have a look: I suspect the appeal of efivarfs is that it allows for
things like non-case-sensitive matching on the GUID part of the filename
while retaining case-sensitivity on the part of the filename
representing the variable name.

As suggested, I'll try a sysfs class. I think that will allow me to
kill off most of the abstraction layer too. Thanks for the input.

Regards,
Daniel

>
> thanks,
>
> greg k-h
