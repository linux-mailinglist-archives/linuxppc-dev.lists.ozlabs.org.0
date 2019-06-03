Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E6A32846
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 08:06:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HPgX1Bm1zDqNr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 16:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="aphubUVh"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HPf21h8GzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 16:04:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j2so9948190pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 23:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yu2/QYdYkxpI0wI0753yJjQV9PtoJnQe1VqNNsVS3bs=;
 b=aphubUVhsMiGnUOeMnMyI7lxTq+n3noSCUeF8KThf0z1QHyez9071qGf4/J+0AYx2j
 7EX4qwxxsLfRWNCDGAUOjqeq/8KkSvH1AloNF+LhmFceYYqBZSrKgEQeLr2kL2K/CP1x
 qubXvy77wbW4kepsLxkwBv1aVGLgjMWZj2QyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=yu2/QYdYkxpI0wI0753yJjQV9PtoJnQe1VqNNsVS3bs=;
 b=Tf6XfM10L9B9PweYuOrmmh/ocf7j9Po2M4faYWqzWOifdGQjtehuVzKNq0TWd2rHh5
 di3CBREt4vstADJqaiFpC1xM1ycgrcOSP/gxF0x0m8JUW7n0wMMb481GiePZXDEZoFx+
 bs4MSwEaS2ZqQxrQaevi5FqjNKpJLUZ3qbJWS9omMhz4UiSaPrm7/A3UDQ6v63rv9dnJ
 WYtbYt04SQ1/Erf30T0DDJhcWvJwN/h732UwUAm2XRdK/ep/XblnHeNW+7hRbq4Vi5n3
 ZRugFJqAAX8MPyJkEHwjB3I5VizfjmfXDxvj3X5jqThyEH73ctHXg9dgX9YcYeFDJJmB
 3l4w==
X-Gm-Message-State: APjAAAVRJgNSiynH+81uOWEFHqoQ5Y5wJ9Xk6O37hkRpGZWA+fRKCcUX
 xnrOhBN6AXlmFT40hAfC//kB0Q==
X-Google-Smtp-Source: APXvYqwT9Vvjbf/NhlVK14zjh2bM51qRa/LyZ6n7vlQ4k8i3JEcJFFi/CRT05Ww3oEry4M4uabCyRQ==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr2690037pjq.87.1559541877706; 
 Sun, 02 Jun 2019 23:04:37 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id n7sm4351814pgi.54.2019.06.02.23.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Jun 2019 23:04:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna <nayna@linux.vnet.ibm.com>, nayna@linux.ibm.com,
 cclaudio@linux.ibm.com, linux-fsdevel@vger.kernel.org, greg@kroah.com,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
In-Reply-To: <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
Date: Mon, 03 Jun 2019 16:04:32 +1000
Message-ID: <87zhmzxkzz.fsf@dja-thinkpad.axtens.net>
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

Hi Nayna,

>> As PowerNV moves towards secure boot, we need a place to put secure
>> variables. One option that has been canvassed is to make our secure
>> variables look like EFI variables. This is an early sketch of another
>> approach where we create a generic firmware variable file system,
>> fwvarfs, and an OPAL Secure Variable backend for it.
>
> Is there a need of new filesystem ? I am wondering why can't these be=20
> exposed via sysfs / securityfs ?
> Probably, something like... /sys/firmware/secureboot or=20
> /sys/kernel/security/secureboot/=C2=A0 ?

I suppose we could put secure variables in sysfs, but I'm not sure
that's what sysfs was intended for. I understand sysfs as "a
filesystem-based view of kernel objects" (from
Documentation/filesystems/configfs/configfs.txt), and I don't think a
secure variable is really a kernel object in the same way most other
things in sysfs are... but I'm open to being convinced.

securityfs seems to be reserved for LSMs, I don't think we can put
things there.

My hope with fwvarfs is to provide a generic place for firmware
variables so that we don't need to expand the list of firmware-specific
filesystems beyond efivarfs. I am also aiming to make things simple to
use so that people familiar with firmware don't also have to become
familiar with filesystem code in order to expose firmware variables to
userspace.

> Also, it sounds like this is needed only for secure firmware variables=20
> and does not include
> other firmware variables which are not security relevant ? Is that=20
> correct understanding ?

The primary use case at the moment - OPAL secure variables - is security
focused because the current OPAL secure variable design stores and
manipulates secure variables separately from the rest of nvram. This
isn't an inherent feature of fwvarfs.

fwvarfs can also be used for variables that are not security relevant as
well. For example, with the EFI backend (patch 3), both secure and
insecure variables can be read.

Regards,
Daniel
