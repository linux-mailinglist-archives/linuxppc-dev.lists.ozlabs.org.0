Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A4142473
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 08:50:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481P2w06H3zDqc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 18:50:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481P1172RmzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 18:48:21 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id b6so28416668wrq.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jan 2020 23:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zqYxlN8e9d1Xz81Z1GDVgte6q0CcV1j9cxyhLBRYIzc=;
 b=HOmBkv+A2CqPfCoV8n7edfKF4E6yimmrEx+0B7Gtjh4iXJtSP/yan+4oFLY5KUjIzQ
 yPt8YV3OBCykOPzd18ZeKkc+VPvdOZpT84aLnaJcd3ApkT5aNJqgU6ddwbDV8eYUne2N
 AhrZygxbNGGopaJVMNCeQUfMhAW9p/5n5OARzHtuWnmLRJZDknpxd/ZdsDopQ4rBZ9bt
 2LpVV5+7TYVdpEs+houBGoEUUT2yLSezUd+ncBRx6Q4VJVQiRpQeSaMltq2OsJwBAm7d
 uj8IEYTPjo1uBvTD8PT9nRnBOpyd4XQnwFIFpoNlaiOq6fSN4EwQlB3z4ccmY9biIN+3
 giIw==
X-Gm-Message-State: APjAAAVNGAgoDc006Za8coqjvP8J0RCagUZqOwDU8ERgD5LKn4VtmFHf
 oGf/j4fZwm7FWVwQmmDZjnU=
X-Google-Smtp-Source: APXvYqz1nmDNYIQNXhicabxXmw6QCSsn8nPgAPz6zQN+UoT7JCsFPNK6ech+vI4kj8faRntichl/eA==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr16459256wrr.215.1579506498444; 
 Sun, 19 Jan 2020 23:48:18 -0800 (PST)
Received: from localhost (ip-37-188-138-155.eurotel.cz. [37.188.138.155])
 by smtp.gmail.com with ESMTPSA id u16sm3099104wmj.41.2020.01.19.23.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 23:48:17 -0800 (PST)
Date: Mon, 20 Jan 2020 08:48:16 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200120074816.GG18451@dhcp22.suse.cz>
References: <20200117105759.27905-1-david@redhat.com>
 <20200117113353.GT19428@dhcp22.suse.cz>
 <c82a0dd7-a99b-6def-83d4-a19fbdd405d9@redhat.com>
 <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
 <20200117152947.GK19428@dhcp22.suse.cz>
 <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
 <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 David Hildenbrand <david@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 17-01-20 08:57:51, Dan Williams wrote:
[...]
> Unless the user is willing to hold the device_hotplug_lock over the
> evaluation then the result is unreliable.

Do we want to hold the device_hotplug_lock from this user readable file
in the first place? My book says that this just waits to become a
problem.

Really, the interface is flawed and should have never been merged in the
first place. We cannot simply remove it altogether I am afraid so let's
at least remove the bogus code and pretend that the world is a better
place where everything is removable except the reality sucks...
-- 
Michal Hocko
SUSE Labs
