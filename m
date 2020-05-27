Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0E1E4FDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:09:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XNkj335czDqXR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 07:09:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Wvcvd2qt; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wvcvd2qt; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XNhk2b0YzDqGX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 07:08:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590613681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
 b=Wvcvd2qty/6nMECvyDauW30OyC5QDVB51wRwSxuhItNMT8rkQE+D2VD471RRLS5pIRqw1S
 tVERUUP2BOmEJs5+prld19JF2mO40pPn6EzAvsotBm8X0Z0O0uZ5QkOT3AGxdLu6Y5zuIO
 Tji2zLno2fg6U3oKX4OLhI06g4PkFoE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590613681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
 b=Wvcvd2qty/6nMECvyDauW30OyC5QDVB51wRwSxuhItNMT8rkQE+D2VD471RRLS5pIRqw1S
 tVERUUP2BOmEJs5+prld19JF2mO40pPn6EzAvsotBm8X0Z0O0uZ5QkOT3AGxdLu6Y5zuIO
 Tji2zLno2fg6U3oKX4OLhI06g4PkFoE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-DMIKlsEZP-2ZuIxMUzkumw-1; Wed, 27 May 2020 17:07:57 -0400
X-MC-Unique: DMIKlsEZP-2ZuIxMUzkumw-1
Received: by mail-wr1-f72.google.com with SMTP id c14so10546541wrm.15
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
 b=Z5IPvHZTNwAYWOknHnSMU3tN4YuzUf+t/IiHuIgR2B/ZCNHO77T62V1GJ/AbV9lwig
 G16D2y2qQ1BNGMXLrNaHSnVYw9BORda7FzlsVE956DS7DKNexpSz9CHnzlX9dSwmCnuL
 GsuTDGZ7NRt/wWcJwblytUFM9NrZ3FdASyIXLrtghgynX1jc/gbDBAxsYGWrGMqQhvmD
 C6S7/L8lCg1NX51TsBzEw69ILo3LQl2/CQzoIXJ6QsupjlanRWHQG5ERojn0dUxxbmf3
 njaz3qcJM24mz+qNP0mjGhkgwF7f5S84Hm48YZhX0sTH4r73se+6k7TScMknJn9lnua9
 coQA==
X-Gm-Message-State: AOAM533K2F8ABcVxaqLlI2Qv5solm7PRHYgnDFLFVMsJWqMaXMsdtjox
 hsngfjFX/PHcBrDxOsLu/Do8wsvVjZYf5FldXbktx8nh+cttKcl8093AV2Av+rnIcQyWBKb1+7N
 92b8FCM1CAFUhABKhH110CcM3nw==
X-Received: by 2002:adf:e908:: with SMTP id f8mr195572wrm.184.1590613676642;
 Wed, 27 May 2020 14:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/MqK9aixnJqSNydmC9tSwCyqyq7nI9EAoQtkXsEPNQuE8I0JoA6xnM6f4HETfKsks8bq+5g==
X-Received: by 2002:adf:e908:: with SMTP id f8mr195551wrm.184.1590613676318;
 Wed, 27 May 2020 14:07:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8?
 ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
 by smtp.gmail.com with ESMTPSA id v27sm4074887wrv.81.2020.05.27.14.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 14:07:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To: Jakub Kicinski <kuba@kernel.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
Date: Wed, 27 May 2020 23:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/05/20 22:23, Jakub Kicinski wrote:
> On Wed, 27 May 2020 15:14:41 +0200 Emanuele Giuseppe Esposito wrote:
>> Regarding the config, as I said the idea is to gather multiple 
>> subsystems' statistics, therefore there wouldn't be a single 
>> configuration method like in netlink.
>> For example in kvm there are file descriptors for configuration, and 
>> creating them requires no privilege, contrary to the network interfaces.
>
> Enumerating networking interfaces, addresses, and almost all of the
> configuration requires no extra privilege. In fact I'd hope that
> whatever daemon collects network stats doesn't run as root :)
> 
> I think enumerating objects is of primary importance, and statistics 
> of those objects are subordinate.

I see what you meant now.  statsfs can also be used to enumerate objects
if one is so inclined (with the prototype in patch 7, for example, each
network interface becomes a directory).

> Again, I have little KVM knowledge, but BPF also uses a fd-based API,
> and carries stats over the same syscall interface.

Can BPF stats (for BPF scripts created by whatever process is running in
the system) be collected by an external daemon that does not have access
to the file descriptor?  For KVM it's of secondary importance to gather
stats in the program; it can be nice to have and we are thinking of a
way to export the stats over the fd-based API, but it's less useful than
system-wide monitoring.  Perhaps this is a difference between the two.

Another case where stats and configuration are separate is CPUs, where
CPU enumeration is done in sysfs but statistics are exposed in various
procfs files such as /proc/interrupts and /proc/stats.

Thanks,

Paolo

