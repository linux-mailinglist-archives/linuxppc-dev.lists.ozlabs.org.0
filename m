Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F81322E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:48:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sSHT5Q31zDqKD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 20:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=daenzer.net
 (client-ip=148.251.143.178; helo=netline-mail3.netline.ch;
 envelope-from=michel@daenzer.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=daenzer.net
X-Greylist: delayed 385 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Jan 2020 20:46:32 AEDT
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by lists.ozlabs.org (Postfix) with ESMTP id 47sSFN5fWDzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 20:46:32 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B99B62A604B;
 Tue,  7 Jan 2020 10:40:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rG9gpTjLrrKc; Tue,  7 Jan 2020 10:40:02 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D33682A6045;
 Tue,  7 Jan 2020 10:40:01 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1iolLE-003KCl-6P; Tue, 07 Jan 2020 10:40:00 +0100
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
To: Romain Dolbeau <romain@dolbeau.org>,
 Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
References: <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <87lfr62tbf.fsf@linux.ibm.com>
 <CADuzgbq3V0F=vob-tB=rroBaLwNR4viS2-=39TRBMyQwdj+xuw@mail.gmail.com>
 <874kx81xxt.fsf@linux.ibm.com>
 <CADuzgbqtn7knixB+tO3m-r0m7fDDQXVA=z2EtGxsfQ_GjD0h7Q@mail.gmail.com>
 <20200106185437.z2aiq3v4zxqmy2x4@csclub.uwaterloo.ca>
 <CADuzgbrw911a45Ep14vVO9WLBryp+DLTX5d5q3_ENDUrpGrpXQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <d54fa811-4006-9247-a189-7b7f61ca2331@daenzer.net>
Date: Tue, 7 Jan 2020 10:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CADuzgbrw911a45Ep14vVO9WLBryp+DLTX5d5q3_ENDUrpGrpXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 jjhdiederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-01-06 8:11 p.m., Romain Dolbeau wrote:
> 
> Unfortunately I don't have a PCIe OpenFirmware ATI card to test the
> theory further.

FWIW, a non-OF Radeon >= R(V)5xx card should work in Linux (though
obviously won't light up in OF itself or MacOS).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
