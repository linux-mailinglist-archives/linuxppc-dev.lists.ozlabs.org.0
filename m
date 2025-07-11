Return-Path: <linuxppc-dev+bounces-10185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A75B014B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 09:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdjzy2BQBz30VF;
	Fri, 11 Jul 2025 17:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752219038;
	cv=none; b=aeGwhznPdTmAQxWtRBdTNbwaibwbq7SET9nj+Hsi4MKhH7alMrAdKxz5Ujz0t+Rl4lXCCrl4n0UmKcdUTr631zFsGGuEiB+oSxC2oiGYIPxl0BGFefo59ljSnZIMHPoFUXSXYE5cAX8+NpgIPFbOEg/iytV76g6QwPUaWlU2LikRkqTZh6/ajXc4k5EeP+1CLpNcKcOu+YM8oRLfbjsJoHXWWic/Dn32rTkXZ8BOLWMqjmJSFBDvspWniUG0yQi6s38PXtINLKR5eMQVvyU3xF7Zpdgi0eOZ+HGU/zCC1hVboOgLtkY2E9d0lDhEd5SiwBnjKSEmuVNnJlP2QHONvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752219038; c=relaxed/relaxed;
	bh=SLciDwhmU2x5Uw3jXKeSDAY6PYwRpmKK2CpnROJ3VAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkOgH03cn2gGELGs6k+inuWdG5EA0olJuhe4+OMzls+JX9fLqzIt4Hp/U/EDJpXFuCSJhcAZUO/VlG7U4O5RnDsufAevCrH71AUsdflR6Ps0qudzhghSRUt9Jn6pwk1OFXJ6mPmH9Ah9kK1X3bvlDBAb36/sOvemgNp6FdEYfAkIaPuspw8buwh/xDF6EOaempO7Em9hGtq21X6iSrdytJ/q0oT+v3W4iE+lm6k8XeKaIzW3OOwFmJvYzSV0FrNQhzA41/EAC0nC/FV+lWk+F+bkPmv8JLMqkZcE73Vvof7ZoZbQt5dW9U6/9Y03UC4FhXKFncdIKOE9YBxGfM2LBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lGEJEelw; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lGEJEelw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdjzw52NRz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 17:30:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EBA944FF4;
	Fri, 11 Jul 2025 07:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2052C4CEED;
	Fri, 11 Jul 2025 07:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752219034;
	bh=pT4xr25h93j0ZqqII9Nj3hCTFizY/oID/swt1J6vurU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGEJEelwUyYuRvhj82dJRzXqyXiJt/Hqq6g6H3IlCwKtFFJUvMSULkZGNjzul7iDZ
	 E2jBAkEH3Ng4wnr4fdgouMjbHMRaGvLWDXTyunnJPFYCmOIpEIerU/fWy2tDGtXMYm
	 lzTP9c3FngPwfbqG+YufABBmFtWdHzIeSL5fd/gU=
Date: Fri, 11 Jul 2025 09:30:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <2025071152-name-spoon-88e8@gregkh>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 09:09:08AM +0200, Thomas Huth wrote:
> On 11/07/2025 07.52, Greg Kroah-Hartman wrote:
> > On Fri, Jul 11, 2025 at 07:35:09AM +0200, Thomas Huth wrote:
> > > From: Thomas Huth <thuth@redhat.com>
> > > 
> > > The FSF does not reside in the Franklin street anymore. Let's update
> > > the address with the link to their website, as suggested in the latest
> > > revision of the GPL-2.0 license.
> > > (See https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt for example)
> > > 
> > > Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   v2: Resend with CC: linux-spdx@vger.kernel.org as suggested here:
> > >       https://lore.kernel.org/linuxppc-dev/e5de8010-5663-47f4-a2f0-87fd88230925@csgroup.eu
> > >   arch/powerpc/boot/crtsavres.S            | 5 ++---
> > >   arch/powerpc/include/uapi/asm/eeh.h      | 5 ++---
> > >   arch/powerpc/include/uapi/asm/kvm.h      | 5 ++---
> > >   arch/powerpc/include/uapi/asm/kvm_para.h | 5 ++---
> > >   arch/powerpc/include/uapi/asm/ps3fb.h    | 3 +--
> > >   arch/powerpc/lib/crtsavres.S             | 5 ++---
> > >   arch/powerpc/xmon/ppc.h                  | 5 +++--
> > >   7 files changed, 14 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/boot/crtsavres.S b/arch/powerpc/boot/crtsavres.S
> > > index 085fb2b9a8b89..a710a49a5dbca 100644
> > > --- a/arch/powerpc/boot/crtsavres.S
> > > +++ b/arch/powerpc/boot/crtsavres.S
> > > @@ -26,9 +26,8 @@
> > >    * General Public License for more details.
> > >    *
> > >    * You should have received a copy of the GNU General Public License
> > > - * along with this program; see the file COPYING.  If not, write to
> > > - * the Free Software Foundation, 51 Franklin Street, Fifth Floor,
> > > - * Boston, MA 02110-1301, USA.
> > > + * along with this program; see the file COPYING.  If not, see
> > > + * <https://www.gnu.org/licenses/>.
> > >    *
> > >    *    As a special exception, if you link this library with files
> > >    *    compiled with GCC to produce an executable, this does not cause
> > 
> > Please just drop all the "boilerplate" license text from these files,
> > and use the proper SPDX line at the top of them instead.  That is the
> > overall goal for all kernel files.
> 
> Ok, I can do that for the header files ... not quite sure about the *.S
> files though since they contain some additional text about exceptions.

That's a crazy exception, and one that should probably be talked about
with the FSF to determine exactly what the SPDX lines should be.

thanks,

greg k-h

